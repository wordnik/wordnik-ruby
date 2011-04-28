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
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end
  
end