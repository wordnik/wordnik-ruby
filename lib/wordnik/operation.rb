module Wordnik
  
  class Operation
    require 'active_model'
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :http_method, :summary, :notes, :parameters, :response, :open
  
    validates_presence_of :http_method, :summary, :notes, :parameters, :response, :open
  
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name.to_s.underscore.to_sym}=", value)
      end
    
      self.http_method = self.http_method.to_s.downcase
    
      # Generate OperationParameter instances from JSON
      if self.parameters
        self.parameters = self.parameters.map do |parameterData|
          OperationParameter.new(parameterData)
        end
      end

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

  end
  
end