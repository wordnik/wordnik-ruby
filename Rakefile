require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'wordnik'

RSpec::Core::RakeTask.new('spec')

# If you want to make this the default task
task :default => :spec

desc 'Download the latest swagger API docs and build out resource methods'
task :swagger do
  
  # Configure default input values..
  settings = {
    :scheme => 'http',
    :host => 'beta.wordnik.com',
    :base_path => "/v4",
    :api_key => '',
  }

  # Ask user for each setting, using the defaults where user input is blank
  settings.each do |name, default_value|
    puts "\nEnter the #{name} (default is '#{default_value}'): "
    input = STDIN.gets.chomp
    settings[name.to_sym] = input unless input.blank?
  end
  
  # Configure Wordnik, but tell it not to attempt to build resources
  # (there aren't any JSON docs yet.. a chicken/egg thing.)
  Wordnik.configure(false) do |config|
    config.scheme = settings[:scheme]
    config.host = settings[:host]
    config.base_path = settings[:base_path]
    config.api_key = settings[:api_key] unless settings[:api_key].blank?
  end

  puts "\nDownloading resource descriptions"
  Wordnik.download_resource_descriptions
  
  Wordnik.instantiate_resources

  puts "\nWriting convenience methods"
  Wordnik.resources.each_pair do |name, resource|
    resource.write_convenience_methods
  end
  
end