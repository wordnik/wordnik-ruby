require 'wordnik/endpoint'
require 'wordnik/operation'
require 'wordnik/operation_parameter'
require 'wordnik/request'
require 'wordnik/resource'
require 'wordnik/response'
require 'wordnik/configuration'
require 'wordnik/version'

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
    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?

      self.build_resources
    end

    # Iterate over each disk-cached JSON resource documentation file
    # 
    def build_resources
      self.resources = {}
      self.resource_names.map do |resource_name|
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
      Wordnik.configuration.user_id.present? && Wordnik.configuration.auth_token.present?
    end
    
    def de_authenticate
      Wordnik.configuration.user_id = nil
      Wordnik.configuration.auth_token = nil
    end
    
    def authenticate
      return if Wordnik.authenticated?
      
      if Wordnik.configuration.username.blank? || Wordnik.configuration.password.blank?
        raise ConfigurationError, "Username and password are required to authenticate."
      end
      
      # response_body = Wordnik.account.get_authenticate(Wordnik.configuration.username, :password => Wordnik.configuration.password)
      
      request = Wordnik::Request.new(
        :get, 
        "account/authenticate/{username}", 
        :params => {:username => Wordnik.configuration.username, :password => Wordnik.configuration.password}
      )
      
      response_body = request.response.body
      
      if response_body.is_a?(Hash) && response_body['userId'].present? && response_body['token'].present?
        Wordnik.configuration.user_id = response_body['userId']
        Wordnik.configuration.auth_token = response_body['token']
      else
        raise ApiServerError, response_body.to_s
      end
    end
    
    # The names of all the resources (in the production API).
    # This is used by Wordnik.build_resources and the rake task that fetches remote API docs
    #
    def resource_names
      %w(account corpus document partners system tag user users word words wordList wordLists wordoftheday)
    end
    
    # Aliases. For convenience.
    #
    def account; Wordnik.resources[:account]; end
    def analytics; Wordnik.resources[:analytics]; end
    def corpus; Wordnik.resources[:corpus]; end
    def document; Wordnik.resources[:document]; end
    def partners; Wordnik.resources[:partners]; end
    def system; Wordnik.resources[:system]; end
    def tag; Wordnik.resources[:tag]; end
    def user; Wordnik.resources[:user]; end
    def users; Wordnik.resources[:users]; end
    def word; Wordnik.resources[:word]; end
    def words; Wordnik.resources[:words]; end
    def word_list; Wordnik.resources[:word_list]; end
    def word_lists; Wordnik.resources[:word_lists]; end
    def wordoftheday; Wordnik.resources[:wordoftheday]; end
        
  end
  
end

class ConfigurationError < StandardError
end

class ApiServerError < StandardError
end