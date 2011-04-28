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
      if self.raw_data['endPoints']
        self.endpoints = self.raw_data['endPoints'].map do |endpointData|
          Endpoint.new(self, endpointData)
        end
      end

      # Collect all of this resource's operation nicknames
      nicknames = (self.endpoints || []).map do |endpoint|
        (endpoint.operations || []).map do |operation|
          operation.nickname.to_sym
        end.compact.flatten
      end.compact.flatten
      Resource.define_methods(nicknames)
    end

    # Define a method for each operation nickname    
    def self.define_methods(nicknames)
      nicknames.each do |nickname|
        Resource.define_method(nickname) do |*args|
          nickname = __method__.to_s
          
          # Extrapolate HTTP method from beginning of method name
          # e.g. 'post_words' -> :post
          http_method = nickname.split("_").first.to_sym

          # Ruby turns all key-value arguments at the end into a single hash
          # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
          # becomes {:limit => 10, :part_of_speech => 'verb'}
          last_arg = args.pop if args.last.is_a?(Hash)
          last_arg = args.pop if args.last.is_a?(Array)
          last_arg ||= {}
          
          # Look for a kwarg called :request_only, whose presence indicates
          # that we want the request itself back, not the response body
          if last_arg.is_a?(Hash) && last_arg[:request_only].present?
            build_only = true
            last_arg.delete(:request_only)
          end

          if [:post, :put].include?(http_method)
            params = nil
            body = last_arg
          else
            params = last_arg
            body = nil
          end

          # Find the path that corresponds to this method nickname
          # e.g. post_words -> "/wordList.{format}/{wordListId}/words"
          begin
            path = self.path_for_operation_nickname(nickname)
            raise if path.blank?
          rescue
            raise "Cannot find a resource path that corresponds to the method nickname '#{nickname}'"
          end

          # Take the '.{format}' portion out of the string so it doesn't interfere with 
          # the interpolation we're going to do on the path.
          path.gsub!('.{format}', '')

          # Stick the remaining (required) arguments into the path string
          args.each do |arg|
            path.sub!(/\{\w+\}/, arg)
          end

          request = Wordnik::Request.new(http_method, path, :params => params, :body => body)

          if build_only
            request 
          else
            request.response.body
          end
        end
      end
    end
  
    # Cycle through endpoints and their operations in search of
    # the path that corresponds to the given nickname
    def path_for_operation_nickname(nickname)
      self.endpoints.each do |endpoint|
        endpoint.operations.each do |operation|
          return endpoint.path if operation.nickname == nickname
        end
      end
      nil
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end
  
end