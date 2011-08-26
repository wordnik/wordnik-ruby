module Wordnik

  class Configuration

    # Wordnik credentials
    attr_accessor :api_key
    attr_accessor :username
    attr_accessor :password
    
    # TODO: Steal all the auth stuff from the old gem!
    attr_accessor :auth_token
    attr_accessor :user_id
    
    # Response format can be :json (default) or :xml
    attr_accessor :response_format
    
    # A comma-delimited list of the API's resources
    attr_accessor :resource_names
    
    # The URL of the API server
    attr_accessor :scheme
    attr_accessor :host
    attr_accessor :base_path
    
    # Defaults go in here..
    def initialize
      @response_format = :json
      @scheme = 'http'
      @host = 'api.wordnik.com'
      @base_path = '/v4'
      
      # Build the default set of resource names from the filenames of the API documentation
      begin
        api_docs_path = File.join(File.dirname(__FILE__), "../../api_docs")
        @resource_names = `find #{api_docs_path} -name '*.json'`.split("\n").map {|f| f.split("/").last.sub('.json', '') }
      rescue
        raise "Problem loading the resource files in ./api_docs/"
      end      
    end
    
    def base_url
      @base_url ||= begin
        u = Addressable::URI.new
        u.host = self.host
        u.path = self.base_path
        u.scheme = self.scheme # For some reason this must be set _after_ host, otherwise Addressable gets upset
        u.to_s
      end
    end

  end

end
