module Wordnik
  
  class Operation
    require 'active_model'
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :endpoint, :http_method, :summary, :notes, :parameters, :response, :open, :nickname
  
    validates_presence_of :endpoint, :http_method, :summary, :notes, :parameters, :response, :open
  
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
      end
      
      # Define nickname
      self.nickname = [self.http_method, self.endpoint.path].
        join("_").                                                        # join http method and path
        gsub(/\{\w+\}/, "").                                              # remove path params
        tr("/", "_").                                                     # replace slashes with underscores
        tr(' .', '').                                                     # remove spaces and dots
        underscore.                                                        # underscore
        gsub(/_+/, "_").                                                  # reduce multiple consective underscores to one
        gsub("_#{self.endpoint.resource.name.to_s.underscore}", "").      # remove resource name
        gsub(/_$/, "")                                                    # remove underscore from end of string

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

    # It's an ActiveModel thing..
    def persisted?
      false
    end

    def positional_parameter_names
      self.parameters.map do |parameter|
        parameter.name if parameter.positional?
      end.compact
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