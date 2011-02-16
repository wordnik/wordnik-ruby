module Wordnik

  class Configuration

    # The API key for your project, found on the project edit form.
    attr_accessor :api_key
    
    # Response format can be :json (default) or :xml
    attr_accessor :response_format
    
    # The URL of the API server
    attr_accessor :base_uri

    def initialize
      @response_format = :json
      @base_uri = 'beta.wordnik.com/v4'
    end

  end

end
