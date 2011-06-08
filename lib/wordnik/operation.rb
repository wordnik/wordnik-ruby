module Wordnik
  
  class Operation  
    attr_accessor :endpoint, :http_method, :summary, :notes, :parameters, :response, :open, :nickname, :deprecated, :category, :suggested_name
  
  
    def initialize(endpoint, attributes = {})
      self.endpoint = endpoint
      
      attributes.each do |name, value|
        send("#{name.to_s.underscore.to_sym}=", value)
      end
      
      # munge that meth!
      self.http_method = self.http_method.to_s.downcase
    
      # Generate OperationParameter instances from JSON
      if self.parameters
        self.parameters = self.parameters.map do |parameterData|
          OperationParameter.new(parameterData)
        end
      else
        self.parameters = []
      end
      
      self.nickname = self.suggested_name.underscore
    end
    
    # A globally unique identifier for the operation
    def slug
      [self.endpoint.resource.name, self.nickname].join("_")
    end
      
    def get?
      self.http_method.downcase == "get"
    end
  
    # Can this operation be run in the sandbox?
    def sandboxable?
      self.get?
    end


    def positional_parameter_names
      self.parameters.select(&:positional?).compact.map(&:name)
    end
    
    def required_kwargs
      self.parameters.map do |parameter|
        next if parameter.name.to_sym == :format
        next if parameter.positional?
        next unless parameter.required?
        parameter
      end.compact
    end
    
    def optional_kwargs
      self.parameters.map do |parameter|
        next if parameter.required?
        parameter
      end.compact      
    end

  end
  
end