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
    #     config.api_key = '1234567890abcdef'
    #     config.response_format = :json
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
        begin
          # This is the path the installed gem will want
          filename = File.join(ENV['GEM_HOME'], "gems", "wordnik-#{Wordnik::VERSION}", "api_docs/#{resource_name}.json")
          raw_data = JSON.parse(File.read(filename))
        rescue
          # This is the path the not-installed gem in development will want
          filename = File.join("api_docs/#{resource_name}.json")
          raw_data = JSON.parse(File.read(filename))
        end
        resource = Resource.new(
          :name => name,
          :raw_data => raw_data
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
    
    def word
      Wordnik.resources[:word]
    end
    
  end
  
end