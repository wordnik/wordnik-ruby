require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'wordrabbit'

RSpec::Core::RakeTask.new('spec')

# If you want to make this the default task
task :default => :spec

desc 'Download the latest API docs and build out resource methods'
task :abracadabra do
  Rake::Task['fetch_api_docs'].invoke
  # Rake::Task['write_resource_methods'].invoke
  # Rake::Task['generate_usage_docs'].invoke  
end

desc 'Download the API docs to disk'
task :fetch_api_docs do
  
  puts "\nFetch API Docs"
  puts "--------------\n"

  puts "\nEnter the base path (leave blank to default to beta.wordnik.com/v4): "
  base_uri = STDIN.gets.chomp.sub('http://', '').sub('https://', '')
  base_uri = 'beta.wordnik.com/v4' if base_uri.blank?
  
  puts "\nEnter a space-delimited list of resource names (optional): "
  resource_names = STDIN.gets.chomp.split(" ")
  
  puts "\nEnter API key (leave blank to fetch publically available resources): "
  api_key = STDIN.gets.chomp
    
  # Configure Wordrabbit, but tell it not to attempt to build resources
  # (there aren't any JSON docs yet.. a chicken/egg thing.)
  Wordrabbit.configure(false) do |c|
    c.base_uri = base_uri
    c.resource_names = resource_names unless resource_names.blank?
    c.api_key = api_key unless api_key.blank?
  end

  puts "\nCleanup"
  puts "-------\n"
  
  `rm api_docs/*.json`
  `rm lib/wordrabbit/resource_modules/*.rb`
  
  Wordrabbit.configuration.resource_names.each do |resource_name|
    request = Wordrabbit::Request.new(:get, "#{resource_name}.json")
    filename = "api_docs/#{resource_name}.json"
    File.open(filename, 'w') {|f| f.write(request.response.raw.body) }
  end
  
  puts "\nWrite Resource Methods"
  puts "----------------------\n"
  
  Wordrabbit.build_resources
  
  Wordrabbit.resources.each_pair do |resource_name, resource|

    next unless resource.endpoints.present?
    
    filename = "lib/wordrabbit/resource_modules/#{resource_name}.rb"
    puts filename
    file = File.new(filename, "w")
    lines = []

    lines << "# HEY HACKER! THIS IS AN AUTO-GENERATED FILE."
    lines << "# So don't bother editing it. To see how it's built, take a look at the Rakefile\n"
    
    lines << "module #{resource_name.to_s.camelize}Methods\n"
    
    resource.endpoints.each do |endpoint|
      endpoint.operations.each do |operation|
        
        next if operation.nickname.blank?

        # Comment about the operation
        lines << "  # #{operation.summary}" if operation.summary.present?
        lines << "  # #{operation.notes}" if operation.notes.present?
        lines << "  #" if operation.summary.present?
        
        # Start writing the method
        lines << "  def #{operation.nickname}(#{[operation.positional_parameter_names, '*args'].flatten.join(', ')})"

        # HTTP Method
        lines << "    http_method = :#{operation.http_method}"

        # Path
        lines << "    path = '#{endpoint.path.sub(".{format}", "")}'"
        operation.positional_parameter_names.each do |param|
          # `body` positional params don't get injected into the path will be dealt with separately
          next if param.to_s == 'body' 
          lines << "    path.sub!('\{#{param}\}', #{param}.to_s)"
        end

        lines << "\n    # Ruby turns all key-value arguments at the end into a single hash"
        lines << "    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')"
        lines << "    # becomes {:limit => 10, :part_of_speech => 'verb'}"
        lines << "    last_arg = args.pop if args.last.is_a?(Hash)"
        lines << "    last_arg = args.pop if args.last.is_a?(Array)"
        lines << "    last_arg ||= {}\n"
        
        lines << "    # Look for a kwarg called :request_only, whose presence indicates"
        lines << "    # that we want the request itself back, not the response body"
        lines << "    if last_arg.is_a?(Hash) && last_arg[:request_only].present?"
        lines << "      request_only = true"
        lines << "      last_arg.delete(:request_only)"
        lines << "    end\n"
        
        lines << "    params = last_arg"
        lines << "    body ||= {}"
        
        lines << "    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)"
        lines << "    request_only ? request : request.response.body"
        lines << "  end\n"
        
        # case response.valueType
        # when 'wordObject'
        #   Wordrabbit::Word.new(response.body)
        # when 'List[definition]'
        #   response.body.map do |definition_data|
        #     Wordrabbit::Definition.new(definition_data)
        #   end
        # end
        
      end      
    end

    lines << "end"
    file.write lines.join("\n")
    file.close
    
  end
  
  
end

desc 'Iterate over resource > endpoint > operation nicknames, generating markdown documentation.'
task :generate_usage_docs do
  Wordrabbit.configure
  filename = "USAGE.md"
  file = File.new(filename, "w")
  
  puts "\nGenerate Documentation"
  puts "----------------------\n"
  
  Wordrabbit.resources.each_pair do |resource_name, resource|

    next unless resource.endpoints.present?
    file.write "\n#{resource_name}\n#{"=" * resource_name.size}\n\n"
    
    resource.endpoints.each do |endpoint|
      endpoint.operations.each do |operation|
        
        docs_url = "http://developer.wordnik.com/docs/#!/#{resource.name}/#{operation.nickname}"
        
        puts "Wordrabbit.#{resource_name}.#{operation.nickname}"
        
        # Method name
        file.write "[Wordrabbit.#{resource_name}.#{operation.nickname}(#{operation.positional_parameter_names.join(', ')})](#{docs_url})\n"
        
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


# desc 'Iterate over each resource, generating a ruby module with operation methods for each.'
# task :write_resource_methods do
# 
# end