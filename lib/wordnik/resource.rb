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

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end
  
end