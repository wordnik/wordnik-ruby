module Wordnik

  class Endpoint
    require 'active_model'
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :path, :description, :operations, :resource

    validates_presence_of :path, :description, :operations

    def initialize(resource, attributes = {})
      self.resource = resource
      
      attributes.each do |name, value|
        send("#{name.to_s.underscore.to_sym}=", value)
      end

      # Generate Operations instances from JSON
      if self.operations
        self.operations = self.operations.map do |operationData|
          Operation.new(self, operationData)
        end
      end
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end

end