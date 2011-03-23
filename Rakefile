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

task :generate_usage_docs do
  Wordnik.configure
  # raise Wordnik.resources[:account].operation_nickname_pairs.keys.inspect
  filename = "USAGE.md"
  file = File.new(filename, "w")

  # Wordnik.resources.each_pair do |resource_name, resource|
  #   next unless resource.operation_nickname_pairs.present?
  #   file.write "\n#{resource_name}\n#{"-" * resource_name.size}\n\n"
  #   
  #   resource.operation_nickname_pairs.each do |nickname, path|
  #     
  #     # Extract positional args from the path
  #     args = path.scan(/\{(\w+)\}/).flatten.select {|a| a != 'format'}
  #     args << "optional_params={}"
  #     file.write "  Wordnik.#{resource_name}.#{nickname}(#{args.join(', ')})\n"
  #   end
  # end
  
  Wordnik.resources.each_pair do |resource_name, resource|
    
    next unless resource.operation_nickname_pairs.present?
    file.write "\n#{resource_name}\n#{"-" * resource_name.size}\n\n"
    
    resource.endpoints.each do |endpoint|
      endpoint.operations.each do |operation|
        
        # Method name
        file.write "  Wordnik.#{resource_name}.#{operation.nickname}(#{operation.positional_parameter_names.join(', ')})\n"
        
        operation.required_kwargs.each do |parameter|
          file.write "    :#{parameter.name}* #{' ' * (29-parameter.name.size)} #{parameter.description}\n"
        end

        operation.optional_kwargs.each do |parameter|
          file.write "    :#{parameter.name} #{' ' * (30-parameter.name.size)} #{parameter.description}\n"
        end
        
      end
      file.write "\n"
    end
  end


  file.close
end