# To jog the memory: Resource > Endpoint > Operation > OperationParameter

module Wordnik
  class Resource
    require 'active_model'
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :name, :raw_data, :endpoints, :models
  
    validates_presence_of :name, :raw_data, :endpoints, :models
  
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
    end
  
    # Cycle through endpoints and their operations in search of
    # the path that corresponds to the given nickname
    def path_for_operation_nickname(nickname)
      self.endpoints.each do |endpoint|
        endpoint.operations.each do |operation|
          return endpoint.path if operation.nickname == nickname
        end
      end
    end
  
    # def operation_nickname_pairs
    #   return @pairs if @pairs
    #   return unless self.endpoints.present?
    #   @pairs = {}
    #   self.endpoints.map do |endpoint|
    #     endpoint.operations.map do |operation|
    #       nickname_parts = []
    #       nickname_parts << operation.http_method
    #       nickname_parts << endpoint.path.gsub(/\{\w+\}/, "").tr("/", "_").tr(' .', '').underscore
    #       nickname = nickname_parts.
    #         join("_").
    #         gsub(/_+/, "_").
    #         gsub("_#{self.name.to_s.underscore}", "").
    #         gsub(/_$/, "")
    #       @pairs[nickname] = endpoint.path
    #     end
    #   end
    #   @pairs
    # end
    
    # Uses the received method name and arguments to dynamically construct a Request
    # If the method name is prefixed with 'build_', then the 'unmade' Request
    # object will be returned instead of the Request Response's body
    # 
    # Wordnik.word.get('dingo')
    # Wordnik.word.get_definitions('dingo', :limit => 20, )
    def method_missing(sym, *args, &block)
      nickname = sym.to_s

      # If method nickname starts with 'build_', 
      # then just build the request but don't run it.
      if nickname =~ /^build_/
        nickname.gsub!('build_', '')
        build_only = true
      end
      
      # Extrapolate HTTP method from beginning of method name
      # e.g. 'post_words' -> :post
      http_method = nickname.split("_").first.to_sym
      
      # Ruby turns all key-value arguments at the end into a single hash
      # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
      # becomes {:limit => 10, :part_of_speech => 'verb'}
      params = args.last.is_a?(Hash) ? args.pop : {}
      
      # Find the path that corresponds to this method nickname
      # e.g. post_words -> "/wordList.{format}/{wordListId}/words"
      path = self.path_for_operation_nickname(nickname)
      
      # Take the '.{format}' portion out of the string so it doesn't interfere with 
      # the interpolation we're going to do on the path.
      path.gsub!('.{format}', '')
      
      # Stick the remaining (required) arguments into the path string
      args.each do |arg|
        path.sub!(/\{\w+\}/, arg)
      end
      
      # TODO: treat kwargs as body instead of params if request method is post or put

      request = Wordnik::Request.new(http_method, path, :params => params)
      
      if build_only
        request 
      else
        request.response.body
      end
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end
  
end