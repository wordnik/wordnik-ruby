require 'rubygems'
require 'bundler/setup'
require 'wordnik'
require 'vcr'
require 'typhoeus'
require 'json'
require 'yaml'
require 'rspec'
require 'active_support/all' # to get methods like blank? and starts_with?

RSpec.configure do |config|
  # some (optional) config here
end

VCR.config do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.stub_with :webmock # or :fakeweb
end

def help
  puts "\nOh noes! You gotta stuff your wordnik credentials in ~/.wordnik.yml like so:\n\n"
  puts "api_key: '12345abcdefg'"
  puts "username: 'fumanchu'"
  puts "password: 'kalamazoo'\n\n"
  exit
end

# Parse ~/.wordnik.yml for user credentials
# begin
  CREDENTIALS = YAML::load_file(File.join(ENV['HOME'], ".wordnik.yml")).symbolize_keys
# rescue
  # help
# end

help unless Object.const_defined? 'CREDENTIALS'
help unless [:api_key, :username, :password].all? {|key| CREDENTIALS[key].present? }

def configure_wordnik
  Wordnik.configure do |config|
    config.api_key = CREDENTIALS[:api_key]
    config.username = CREDENTIALS[:username]
    config.password = CREDENTIALS[:password]
    config.base_uri = "beta.wordnik.com/v4"
    # config.resource_names = %w(account corpus document partners system tag user users word words wordList wordLists)
  end
end

configure_wordnik

# A random string to tack onto stuff to ensure we're not seeing 
# data from a previous test run
RAND = ("a".."z").to_a.sample(8).join