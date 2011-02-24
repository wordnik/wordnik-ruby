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

unless ENV['KEY']
  puts "\nOn Noes! You gotta include your API key when running the specs, like so:\n\nKEY=12345 rake spec\n\n"
  exit
end

Wordnik.configure do |config|
  config.api_key =  ENV['KEY']
  config.base_uri = "beta.wordnik.com/v4"
end