require 'wordnik/endpoint'
require 'wordnik/operation'
require 'wordnik/operation_parameter'
require 'wordnik/request'
require 'wordnik/resource'
require 'wordnik/response'
require 'wordnik/configuration'
require 'wordnik/version'

# http://blog.jayfields.com/2007/10/ruby-defining-class-methods.html
class Object
  def meta_def name, &blk
    (class << self; self; end).instance_eval { define_method name, &blk }
  end
end

module Wordnik
    
  class << self
    
    # A Wordnik configuration object. Must act like a hash and return sensible
    # values for all Wordnik configuration options. See Wordnik::Configuration.
    attr_accessor :configuration

    attr_accessor :resources
    
    # Call this method to modify defaults in your initializers.
    #
    # @example
    #   Wordnik.configure do |config|
    #     config.api_key = '1234567890abcdef'     # required
    #     config.username = 'wordlover'           # optional, but needed for user-related functions
    #     config.password = 'i<3words'            # optional, but needed for user-related functions
    #     config.response_format = :json          # optional, defaults to json
    #   end
    #
    def configure(build=true)
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
      
      # remove :// from scheme
      configuration.scheme.sub!(/:\/\//, '')

      # remove http(s):// and anything after a slash
      configuration.host.sub!(/https?:\/\//, '')
      configuration.host = configuration.host.split('/').first

      # Add leading and trailing slashes to base_path
      configuration.base_path = "/#{configuration.base_path}".gsub(/\/+/, '/')
      configuration.base_path = "" if configuration.base_path == "/"

      # The Rakefile needs to call Wordnik.configure, but can't
      # attach resources because they haven't been downloaded.
      if build
        self.instantiate_resources
        self.create_resource_shortcuts 
      end
    end
    
    # Remove old JSON documentation and generated modules,
    # then download fresh JSON files.
    #
    def download_resource_descriptions
      system "rm api_docs/*.json"
      system "rm lib/wordnik/resource_modules/*.rb"
      
      Wordnik::Request.new(:get, "resources.json").response.body['apis'].each do |api|
        resource_name = api['path'].split(".").first.gsub(/\//, '')
        description = api['description']
        puts "  #{resource_name} #{description}"
        request = Wordnik::Request.new(:get, "#{resource_name}.json")
        filename = "api_docs/#{resource_name}.json"
        File.open(filename, 'w') {|f| f.write(request.response.raw.body) }
      end
    end

    # Iterate over each disk-cached JSON resource documentation file, and
    # 1. Instantiate a Resource object
    # 2. Stuff the Resource in Wordnik.resources
    #
    def instantiate_resources   
      self.resources = {}
      self.configuration.resource_names.each do |resource_name|
        name = resource_name.underscore.to_sym # 'fooBar' => :foo_bar
        filename = File.join(File.dirname(__FILE__), "../api_docs/#{resource_name}.json")        
        resource = Resource.new(
          :name => name,
          :raw_data => JSON.parse(File.read(filename))
        )
        self.resources[name] = resource
      end      
    end
    
    # Use some magic ruby dust to make nice method shortcuts.
    # Wordnik.word => Wordnik.resources[:word]
    # Wordnik.users => Wordnik.resources[:user]
    #
    def create_resource_shortcuts
      self.configuration.resource_names.each do |resource_name|
        method_name = resource_name.underscore.to_sym
        meta_def method_name do
          Wordnik.resources[method_name]
        end
      end
    end
    
    def authenticated?
      Wordnik.configuration.user_id.present? && Wordnik.configuration.auth_token.present?
    end
    
    def de_authenticate
      Wordnik.configuration.user_id = nil
      Wordnik.configuration.auth_token = nil
    end
    
    def authenticate
      return if Wordnik.authenticated?
      
      if Wordnik.configuration.username.blank? || Wordnik.configuration.password.blank?
        raise ClientError, "Username and password are required to authenticate."
      end
      
      request = Wordnik::Request.new(
        :get, 
        "account/authenticate/{username}", 
        :params => {
          :username => Wordnik.configuration.username, 
          :password => Wordnik.configuration.password
        }
      )
      
      response_body = request.response.body
      Wordnik.configuration.user_id = response_body['userId']
      Wordnik.configuration.auth_token = response_body['token']
    end

  end
  
end

class ServerError < StandardError
end

class ClientError < StandardError
end