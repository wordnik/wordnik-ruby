module Wordnik

  class Request
    require 'uri'
    require 'addressable/uri'
    require 'typhoeus'
    require 'active_model'
    require "wordnik/version"
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :host, :path, :format, :params, :body, :http_method, :headers

    validates_presence_of :format, :http_method

    # All requests must have an HTTP method and a path
    # Optionals parameters are :params, :headers, :body, :format, :host
    # 
    def initialize(http_method, path, attributes={})
      attributes[:format] ||= Wordnik.configuration.response_format
      attributes[:params] ||= {}

      # Set default headers
      default_headers = {
        'Content-Type' => "application/#{attributes[:format].downcase}",
        :api_key => Wordnik.configuration.api_key,
        :user_agent => Wordnik.configuration.user_agent
      }

      # api_key from headers hash trumps the default, even if its value is blank
      if attributes[:headers].present? && attributes[:headers].has_key?(:api_key)
        default_headers.delete(:api_key)
      end
      
      # api_key from params hash trumps all others (headers and default_headers)
      if attributes[:params].present? && attributes[:params].has_key?(:api_key)
        default_headers.delete(:api_key)
        attributes[:headers].delete(:api_key) if attributes[:headers].present?
      end
      
      # Merge argument headers into defaults
      attributes[:headers] = default_headers.merge(attributes[:headers] || {})
      
      # Stick in the auth token if there is one
      if Wordnik.authenticated?
        attributes[:headers].merge!({:auth_token => Wordnik.configuration.auth_token})
      end
            
      self.http_method = http_method.to_sym
      self.path = path
      attributes.each do |name, value|
        send("#{name.to_s.underscore.to_sym}=", value)
      end
    end

    # Construct a base URL
    #
    def url(options = {})  
      u = Addressable::URI.new(
        :scheme => Wordnik.configuration.scheme,
        :host => Wordnik.configuration.host,
        :path => self.interpreted_path,
        :query => self.query_string.sub(/\?/, '')
      ).to_s
      
      # Drop trailing question mark, if present
      u.sub! /\?$/, ''
      
      # Obfuscate API key?
      u.sub! /api\_key=\w+/, 'api_key=YOUR_API_KEY' if options[:obfuscated]
      
      u
    end

    # Iterate over the params hash, injecting any path values into the path string
    # e.g. /word.{format}/{word}/entries => /word.json/cat/entries
    def interpreted_path
      p = self.path.dup

      # Fill in the path params
      self.params.each_pair do |key, value|
        p = p.gsub("{#{key}}", value.to_s)
      end

      # Stick a .{format} placeholder into the path if there isn't
      # one already or an actual format like json or xml
      # e.g. /words/blah => /words.{format}/blah
      unless ['.json', '.xml', '{format}'].any? {|s| p.downcase.include? s }
        p = p.sub(/^(\/?\w+)/, "\\1.#{format}")
      end

      p = p.sub("{format}", self.format.to_s)
      
      URI.encode [Wordnik.configuration.base_path, p].join("/").gsub(/\/+/, '/')
    end
  
    # Massage the request body into a state of readiness
    # If body is a hash, camelize all keys then convert to a json string
    #
    def body=(value)      
      if value.is_a?(Hash)
        value = value.inject({}) do |memo, (k,v)|
          memo[k.to_s.camelize(:lower).to_sym] = v
          memo
        end
      end
      @body = value
    end
    
    # If body is an object, JSONify it before making the actual request.
    # 
    def outgoing_body
      body.is_a?(String) ? body : body.to_json
    end
    
    # Construct a query string from the query-string-type params
    def query_string

      # Iterate over all params,
      # .. removing the ones that are part of the path itself.
      # .. stringifying values so Addressable doesn't blow up.
      query_values = {}
      self.params.each_pair do |key, value|
        next if self.path.include? "{#{key}}"                                   # skip path params
        next if value.blank? && value.class != FalseClass                       # skip empties
        key = key.to_s.camelize(:lower).to_sym unless key.to_sym == :api_key    # api_key is not a camelCased param
        query_values[key] = value.to_s
      end
    
      # We don't want to end up with '?' as our query string
      # if there aren't really any params
      return "" if query_values.blank?
    
      # Addressable requires query_values to be set after initialization..
      qs = Addressable::URI.new
      qs.query_values = query_values
      qs.to_s
    end
  
    def make
      request = Typhoeus::Request.new(self.url,
        :headers => self.headers.stringify_keys,
        :method => self.http_method.to_sym)
      
      # Make request proxy-aware 
      if Wordnik.configuration.proxy.present?
        request.proxy = Wordnik.configuration.proxy
        request.proxy_username = Wordnik.configuration.proxy_username if Wordnik.configuration.proxy_username.present?
        request.proxy_password = Wordnik.configuration.proxy_password if Wordnik.configuration.proxy_password.present?
      end
      
      Wordnik.logger.debug "\n  #{self.http_method.upcase} #{self.url}\n  body: #{self.outgoing_body}\n  headers: #{request.headers}\n\n"
      
      request.body = self.outgoing_body unless self.http_method.to_sym == :get

      # Execute the request
      Typhoeus::Hydra.hydra.queue request
      Typhoeus::Hydra.hydra.run  
      Response.new(request.response)
    end
  
    def response
      self.make
    end
  
    def response_code_pretty
      return unless @response.present?
      @response.code.to_s    
    end
  
    def response_headers_pretty
      return unless @response.present?
      # JSON.pretty_generate(@response.headers).gsub(/\n/, '<br/>') # <- This was for RestClient
      @response.headers.gsub(/\n/, '<br/>') # <- This is for Typhoeus
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end
end
