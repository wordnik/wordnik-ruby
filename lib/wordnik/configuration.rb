module Wordnik

  class Configuration
    require 'wordnik/version'

    # Wordnik credentials
    attr_accessor :api_key
    attr_accessor :username
    attr_accessor :password

    # TODO: Steal all the auth stuff from the old gem!
    attr_accessor :auth_token
    attr_accessor :user_id

    # Response format can be 'json' (default) or 'xml'
    attr_accessor :response_format

    # A comma-delimited list of the API's resources
    attr_accessor :resource_names

    # The URL of the API server
    attr_accessor :scheme
    attr_accessor :host
    attr_accessor :hosts # to do in process load balancing
    attr_accessor :load_balancer
    attr_accessor :base_path

    attr_accessor :user_agent

    attr_accessor :proxy
    attr_accessor :proxy_username
    attr_accessor :proxy_password

    attr_accessor :logger

    # Defaults go in here..
    def initialize
      @response_format = 'json'
      @scheme = 'https'
      @host = 'api.wordnik.com'
      @hosts = []
      @load_balancer = nil
      @base_path = '/v4'
      @user_agent = "ruby-#{Wordnik::VERSION}"
      # Build the default set of resource names from the filenames of the API documentation
      begin
        api_docs_path = File.join(File.dirname(__FILE__), "../../api_docs")
        @resource_names = `find #{api_docs_path} -name '*.json'`.split("\n").map {|f| f.split("/").last.sub('.json', '') }.sort
        true
      rescue
        raise "Problem loading the resource files in ./api_docs/"
      end
    end

    def base_url
      Addressable::URI.new(
        :scheme => self.scheme,
        :host => self.host,
        :path => self.base_path
      )
    end

    def clear
      initialize
    end

    def host
      @load_balancer ? @load_balancer.host : @host
    end

  end

end
