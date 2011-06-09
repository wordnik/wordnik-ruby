require 'monkeys'
require 'wordrabbit/configuration'
require 'wordrabbit/endpoint'
require 'wordrabbit/operation'
require 'wordrabbit/operation_parameter'
require 'wordrabbit/request'
require 'wordrabbit/resource'
require 'wordrabbit/response'
require 'wordrabbit/version'

# http://blog.jayfields.com/2007/10/ruby-defining-class-methods.html
class Object
  def meta_def name, &blk
    (class << self; self; end).instance_eval { define_method name, &blk }
  end
end

module Wordrabbit
    
  class << self
    
    # A Wordrabbit configuration object. Must act like a hash and return sensible
    # values for all Wordrabbit configuration options. See Wordrabbit::Configuration.
    attr_accessor :configuration

    attr_accessor :resources
    
    # Call this method to modify defaults in your initializers.
    #
    # @example
    #   Wordrabbit.configure do |config|
    #     config.api_key = '1234567890abcdef'     # required
    #     config.username = 'wordlover'           # optional, but needed for user-related functions
    #     config.password = 'i<3words'            # optional, but needed for user-related functions
    #     config.response_format = :json          # optional, defaults to json
    #   end
    def configure(build=true)
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?

      if build
        self.build_resources
        self.configuration.resource_names.each do |resource_name|
          method_name = resource_name.underscore.to_sym
          meta_def method_name do
            Wordrabbit.resources[method_name]
          end
        end  
      end

    end

    # Iterate over each disk-cached JSON resource documentation file
    # 
    def build_resources
      self.resources = {}
      self.configuration.resource_names.map do |resource_name|
        
        name = resource_name.underscore.to_sym # 'fooBar' => :foo_bar
        filename = File.join(File.dirname(__FILE__), "../api_docs/#{resource_name}.json")
        
        resource = Resource.new(
          :name => name,
          :raw_data => JSON.parse(File.read(filename))
        )
        self.resources[name] = resource
      end
    end

    def authenticated?
      Wordrabbit.configuration.user_id.present? && Wordrabbit.configuration.auth_token.present?
    end
    
    def de_authenticate
      Wordrabbit.configuration.user_id = nil
      Wordrabbit.configuration.auth_token = nil
    end
    
    def authenticate
      return if Wordrabbit.authenticated?
      
      if Wordrabbit.configuration.username.blank? || Wordrabbit.configuration.password.blank?
        raise ConfigurationError, "Username and password are required to authenticate."
      end
      
      # response_body = Wordrabbit.account.get_authenticate(Wordrabbit.configuration.username, :password => Wordrabbit.configuration.password)
      
      request = Wordrabbit::Request.new(
        :get, 
        "account/authenticate/{username}", 
        :params => {:username => Wordrabbit.configuration.username, :password => Wordrabbit.configuration.password}
      )
      
      response_body = request.response.body
      
      if response_body.is_a?(Hash) && response_body['userId'].present? && response_body['token'].present?
        Wordrabbit.configuration.user_id = response_body['userId']
        Wordrabbit.configuration.auth_token = response_body['token']
      else
        raise ApiServerError, response_body.to_s
      end
    end

  end
  
end

class ConfigurationError < StandardError
end

class ApiServerError < StandardError
end