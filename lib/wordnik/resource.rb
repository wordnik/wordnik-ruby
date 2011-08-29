# To jog the memory: Resource > Endpoint > Operation > OperationParameter

module Wordnik
  class Resource
    
    require 'active_model'
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :name, :raw_data, :endpoints, :models
  
    validates_presence_of :name, :raw_data, :endpoints, :models
    
    class << self
        public :define_method
    end
  
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name.to_s.underscore.to_sym}=", value)
      end

      # Generate Endpoint instances from JSON
      if self.raw_data['apis']
        self.endpoints = self.raw_data['apis'].map do |endpointData|
          Endpoint.new(self, endpointData)
        end
      end 
      
      # Attach module containing metaprogramatticaly generated operations.
      module_filename = File.join(File.dirname(__FILE__), "./resource_modules/#{self.name}.rb")
      if File.exist? module_filename
        self.class.send(:require, "wordnik/resource_modules/#{self.name}")
        self.class.send(:include, "#{self.name.to_s.camelize}Methods".constantize)
      end
    end

    def write_convenience_methods
      return unless endpoints.present?

      filename = "lib/wordnik/resource_modules/#{name}.rb"
      puts "  #{filename}"
      file = File.new(filename, "w")
      lines = []

      lines << "# HEY HACKER! THIS IS AN AUTO-GENERATED FILE."
      lines << "# So don't bother editing it. To see how it's built, take a look at the Rakefile\n"

      lines << "module #{name.to_s.camelize}Methods\n"

      endpoints.each do |endpoint|
        endpoint.operations.each do |operation|

          next if operation.nickname.blank?

          # Comment about the operation
          # (Turn newlines into commented newlines)
          lines << "  # #{operation.summary.gsub("\n", "\n  # ")}" if operation.summary.present?
          lines << "  # #{operation.notes.gsub("\n", "\n  # ")}" if operation.notes.present?
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
          lines << "    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')"
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

          lines << "    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)"
          lines << "    request_only ? request : request.response.body"
          lines << "  end\n"
        end      
      end

      lines << "end"
      file.write lines.join("\n")
      file.close
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end
  
end