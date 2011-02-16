class Request
  require 'uri'
  require 'addressable/uri'
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :host, :port, :path, :format, :params, :body, :http_method, :headers
  
  validates_presence_of :host, :path, :format, :http_method
  
  def initialize(http_method, path, attributes={})
    attributes[:format] ||= "json"
    attributes[:host] ||= Wordnik.configuration.base_uri
    attributes[:params] ||= {}

    # Set default headers, but allow them to be overridden
    default_headers = {
      'Content-Type' => "application/#{attributes[:format].downcase}",
    }
    attributes[:headers] = default_headers.merge(attributes[:headers] || {})
    
    self.http_method = http_method.to_sym
    self.path = path
    attributes.each do |name, value|
      send("#{name.to_s.underscore.to_sym}=", value)
    end
  end
  
  # Construct a base URL
  def url
    u = Addressable::URI.new
    u.host = self.host.sub(/\/$/, '')
    u.port = self.port if self.port.present?
    u.path = self.interpreted_path
    u.scheme = "http" # For some reason this must be set _after_ host, otherwise Addressable gets upset
    u.to_s
  end
  
  # Iterate over the params hash, injecting any path values into the path string
  # e.g. /word.{format}/{word}/entries => /word.json/cat/entries
  def interpreted_path
    p = self.path
    self.params.each_pair do |key, value|
      p = p.gsub("{#{key}}", value.to_s)
    end
    
    # Stick a .{format} placeholder into the path if there isn't
    # one already or an actual format like json or xml
    # e.g. /words/blah => /words.{format}/blah
    unless ['.json', '.xml', '{format}'].any? {|s| p.downcase.include? s }
      p = p.sub(/^(\/?\w+)/, "\\1.#{format}")
    end

    p = p.sub("{format}", self.format)
    URI.encode(p)
  end
  
  def interpreted_body
    return unless self.body.present?
    return self.body.to_json if self.body.is_a?(Hash)
    self.body
  end
  
  # Iterate over all params,
  # .. removing the ones that are part of the path itself.
  # .. stringifying values so Addressable doesn't blow up.
  # .. obfuscating the API key if needed.
  def query_string_params(obfuscated=false)
    qsp = {}
    self.params.each_pair do |key, value|
      next if self.path.include? "{#{key}}"
      next if value.blank?
      value = "YOUR_API_KEY" if key.to_sym == :api_key && obfuscated
      qsp[key] = value.to_s
    end
    qsp
  end
  
  # Construct a query string from the query-string-type params
  def query_string(options={})
    
    # We don't want to end up with '?' as our query string
    # if there aren't really any params
    return "" if query_string_params.blank?
    
    default_options = {:obfuscated => false}
    options = default_options.merge(options)
    
    qs = Addressable::URI.new
    qs.query_values = self.query_string_params(options[:obfuscated])
    qs.to_s
  end
  
  # Returns full request URL with query string included
  def url_with_query_string(options={})
    default_options = {:obfuscated => false}
    options = default_options.merge(options)
    
    [url, query_string(options)].join('')
  end
  
  def make
    response = case self.http_method.to_sym
    when :get
      Typhoeus::Request.get(
        self.url_with_query_string,
        :headers => self.headers.stringify_keys
      )

    when :post
      Typhoeus::Request.post(
        self.url_with_query_string,
        :body => self.interpreted_body,
        :headers => self.headers.stringify_keys
      )

    when :put
      Typhoeus::Request.put(
        self.url_with_query_string,
        :body => self.interpreted_body,
        :headers => self.headers.stringify_keys
      )
      
    when :delete
      Typhoeus::Request.delete(
        self.url_with_query_string,
        :body => self.interpreted_body,
        :headers => self.headers.stringify_keys
      )
    end

    @response_obj = Response.new(response)
  end
  
  # If the request has been made, return the existing response
  # If not, make the request and return the response
  def response
    @response_obj || self.make
  end
  
  def response_code_pretty
    return unless @response.present?
    @response.code.to_s    
  end
  
  def response_headers_pretty
    return unless @response.present?
    # JSON.pretty_generate(@response.headers).gsub(/\n/, '<br/>').html_safe # <- This was for RestClient
    @response.headers.gsub(/\n/, '<br/>').html_safe # <- This is for Typhoeus
  end

  # It's an ActiveModel thing..
  def persisted?
    false
  end

end