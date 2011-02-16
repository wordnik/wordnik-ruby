require 'wordnik/endpoint'
require 'wordnik/operation'
require 'wordnik/operation_parameter'
require 'wordnik/request'
require 'wordnik/resource'
require 'wordnik/response'
require 'wordnik/configuration'

module Wordnik
  
  API_VERSION = "4.01.61"
  
  class << self
    
    # A Wordnik configuration object. Must act like a hash and return sensible
    # values for all Wordnik configuration options. See Wordnik::Configuration.
    attr_accessor :configuration
    
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
    end
    
  end
  
end