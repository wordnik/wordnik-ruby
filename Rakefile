require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'wordnik'

RSpec::Core::RakeTask.new('spec')

# If you want to make this the default task
task :default => :spec


desc 'Download the API docs to disk'
task :fetch_api_docs do
  
  Wordnik.configure {|c| c.base_uri = 'beta.wordnik.com/v4' }
  
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

desc 'Iterate over resource>endpoint>operation nicknames, generating markdown documentation.'
task :generate_usage_docs do
  Wordnik.configure
  filename = "USAGE.md"
  file = File.new(filename, "w")
  
  Wordnik.resources.each_pair do |resource_name, resource|

    next unless resource.endpoints.present?
    file.write "\n#{resource_name}\n#{"=" * resource_name.size}\n\n"
    
    resource.endpoints.each do |endpoint|
      endpoint.operations.each do |operation|
        
        docs_url = "http://developer.wordnik.com/docs/#!/#{resource.name}/#{operation.nickname}"
        
        # Method name
        file.write "[Wordnik.#{resource_name}.#{operation.nickname}(#{operation.positional_parameter_names.join(', ')})](#{docs_url})\n"
        
        # Required kwargs
        operation.required_kwargs.each do |parameter|
          file.write "    :#{parameter.name.to_s.underscore}* #{' ' * (29-parameter.name.to_s.underscore.size)} #{parameter.description}\n"
        end

        # Optional kwargs
        operation.optional_kwargs.each do |parameter|
          file.write "    :#{parameter.name.to_s.underscore} #{' ' * (30-parameter.name.to_s.underscore.size)} #{parameter.description}\n"
        end
      end
      
      file.write "\n"
    end
  end

  file.close
end


desc 'Write ruby with ruby.'
task :write_resource_methods do
  Wordnik.configure  
  Wordnik.resources.each_pair do |resource_name, resource|

    next unless resource.endpoints.present?
    
    filename = "lib/wordnik/resource_modules/#{resource_name}.rb"
    file = File.new(filename, "w")

    file.write "module #{resource_name.to_s.camelize}Methods\n\n"
    
    resource.endpoints.each do |endpoint|
      endpoint.operations.each do |operation|
        
        next if operation.nickname.blank?

        file.write "  def #{operation.nickname}(#{[operation.positional_parameter_names, '*args'].flatten.join(', ')})\n"

        # HTTP Method
        file.write "    # HTTP Method\n"
        file.write "    http_method = :#{operation.http_method}\n\n"

        # Path
        file.write "    # Path\n"
        file.write "    path = '#{endpoint.path.sub(".{format}", "")}'\n"
        operation.positional_parameter_names.each do |param|
          file.write "    path.sub!('\{#{param}\}', #{param})\n\n"
        end

        # Ruby turns all key-value arguments at the end into a single hash
        # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
        # becomes {:limit => 10, :part_of_speech => 'verb'}
        file.write "    # args\n"
        file.write "    last_arg = args.pop if args.last.is_a?(Hash)\n"
        file.write "    last_arg = args.pop if args.last.is_a?(Array)\n"
        file.write "    last_arg ||= {}\n\n"
        
        # Look for a kwarg called :request_only, whose presence indicates
        # that we want the request itself back, not the response body
        file.write "    if last_arg.is_a?(Hash) && last_arg[:request_only].present?\n"
        file.write "      request_only = true\n"
        file.write "      last_arg.delete(:request_only)\n"
        file.write "    end\n\n"
        
        file.write "    if [:post, :put].include?(http_method)\n"
        file.write "      params = nil\n"
        file.write "      body = last_arg\n"
        file.write "    else\n"
        file.write "      params = last_arg\n"
        file.write "      body = nil\n"
        file.write "    end\n\n"
        
        # Construct the request
        file.write "    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)\n"
        file.write "    request_only ? request : request.response.body\n"
        file.write "  end\n\n"
        
      end      
    end

    file.write "end"
    file.close
    
  end

end