require 'wordnik/endpoint'
require 'wordnik/operation'
require 'wordnik/operation_parameter'
require 'wordnik/request'
require 'wordnik/resource'
require 'wordnik/response'
require 'wordnik/configuration'
require 'wordnik/version'

module Wordnik
  
  API_VERSION = "4.01.61"
  
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
    
    # The names of all the resources.
    # This is used by Wordnik.build_resources and the rake task that fetches remote API docs
    #
    def resource_names
      %w(account corpus document partners system tag user users word words wordList wordLists wordoftheday)
    end
    
    # An alias. For convenience.
    #
    def word
      Wordnik.resources[:word]
    end
    
  end
  
end