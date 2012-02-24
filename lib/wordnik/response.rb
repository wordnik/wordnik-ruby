module Wordnik

  class Response
    require 'active_model'
    require 'json'
    require 'nokogiri'
    require 'htmlentities'
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :raw

    validates_presence_of :raw

    def initialize(raw)
      self.raw = raw
      catch_errors
    end    

    def code
      raw.code
    end
        
    def catch_errors
      case self.code
      when 500..510 then raise(ServerError, self.raw.to_yaml)
      when 299..426 then raise(ClientError, self.raw.to_yaml)
      end
    end

    # If body is JSON, parse it
    # TODO: If body is XML, parse it
    # Otherwise return raw string
    def body
      JSON.parse raw.body
    rescue
      raw.body
    end

    def headers
      h = {}
      raw.headers_hash.each {|k,v| h[k] = v }
      h
    end

    # Extract the response format from the header hash
    # e.g. {'Content-Type' => 'application/json'}
    def format
      headers['Content-Type'].split("/").last.to_s
    end

    def json?
      format == 'json'
    end

    def xml?
      format == 'xml'
    end

    def pretty_body
      return unless body.present?
      case format
      when 'json'
        JSON.pretty_generate(body).gsub(/\n/, '<br/>')
      when 'xml'
        xsl = Nokogiri::XSLT(File.open(File.join(File.dirname(__FILE__), "../../config/pretty_print.xsl")))
        xml = Nokogiri(body)
        coder = HTMLEntities.new
        coder.encode(xsl.apply_to(xml).to_s)
      end
    end

    def pretty_headers
      JSON.pretty_generate(headers).gsub(/\n/, '<br/>')
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end
end