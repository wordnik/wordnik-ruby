require 'wordnik/endpoint'
require 'wordnik/operation'
require 'wordnik/operation_parameter'
require 'wordnik/request'
require 'wordnik/resource'
require 'wordnik/response'

class Wordnik
  
  # See http://tinyurl.com/5t3rhy6 for info on setting up this configuration magic
  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :api_key
  end
  
end