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
    attr_accessor :base_uri
    
    # Defaults go in here..
    def initialize
      @response_format = :json
      @base_uri = 'api.wordnik.com/v4'
      
      # Build the default set of resource names from the filenames of the API documentation
      begin
        @resource_names = `find api_docs -name '*.json'`.split("\n").map {|f| f.split("/").last.sub('.json', '') }
      rescue
        raise "Problem loading the resource files in ./api_docs/"
      end
      
    end

  end

end
