require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'wordnik'

RSpec::Core::RakeTask.new('spec')

# If you want to make this the default task
task :default => :spec


desc 'Download the API docs to disk'
task :fetch_api_docs do
  
  Wordnik.configure
  
  Wordnik.resource_names.each do |resource_name|

    # Roll in API key
    headers = {}
    # headers[:api_key] = params[:api_key] if params[:api_key].present?

    request = Wordnik::Request.new(:get, "#{resource_name}.json", :headers => headers)
    filename = "api_docs/#{resource_name}.json"
    File.open(filename, 'w') {|f| f.write(request.response.raw.body) }
    puts filename
  end
  
end