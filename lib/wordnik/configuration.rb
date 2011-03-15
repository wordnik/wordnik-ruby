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
    
    # The URL of the API server
    attr_accessor :base_uri

    def initialize
      @response_format = :json
      @base_uri = 'api.wordnik.com/v4'
    end

  end

end
