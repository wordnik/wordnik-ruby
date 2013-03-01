require 'rubygems'
require 'bundler/setup'
require 'wordnik'
# require 'vcr'
require 'typhoeus'
require 'json'
require 'yaml'
require 'rspec'

RSpec.configure do |config|
  # some (optional) config here
end

#VCR.config do |config|
#  config.cassette_library_dir = 'spec/vcr'
#  config.stub_with :webmock # or :fakeweb
#end

def help
  puts "\nOh noes! You gotta stuff your wordnik credentials in ~/.wordnik.yml like so:\n\n"
  puts "api_key: 12345abcdefg"
  puts "username: fumanchu"
  puts "password: kalamazoo\n\n"
  puts "You can also put host,"
  exit
end

# Parse ~/.wordnik.yml for user credentials
begin
  CREDENTIALS = YAML::load_file(File.join(ENV['HOME'], ".wordnik.yml")).symbolize_keys
rescue
  help
end

help unless Object.const_defined? 'CREDENTIALS'
help unless [:api_key, :username, :password].all? {|key| CREDENTIALS[key].present? }

def configure_wordnik
  Wordnik.configure do |config|
    config.api_key = CREDENTIALS[:api_key]
    config.username = CREDENTIALS[:username]
    config.password = CREDENTIALS[:password]
    config.logger = CREDENTIALS[:logfile] ? Logger.new(CREDENTIALS[:logfile]) : Logger.new('/dev/null')

    config.host = CREDENTIALS[:host] || 'beta.api.wordnik.com'
    config.hosts = CREDENTIALS[:hosts] || []
    config.base_path = CREDENTIALS[:base_path] || '/v4'

  end
end

configure_wordnik

def sample_resource_body
  @sample_resource_body ||= begin
    File.open(File.join(File.dirname(__FILE__), "../api_docs/word.json"), "r").read
  end
end

class Object
  def has_suffix?(suffix)
    suffix.respond_to?(:to_str) && self[-suffix.length, suffix.length] == suffix
  end
end

# A random string to tack onto stuff to ensure we're not seeing
# data from a previous test run
RAND = ("a".."z").to_a.sample(8).join
