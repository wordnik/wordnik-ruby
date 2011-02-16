require 'rubygems'
require 'bundler/setup'
require 'wordnik'
require 'vcr'
require 'typhoeus'
require 'json'

RSpec.configure do |config|
  # some (optional) config here
end

VCR.config do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.stub_with :webmock # or :fakeweb
end

Wordnik.configure do |config|
  config.api_key = "12345"
end