module Wordnik

  class Endpoint

    attr_accessor :path, :description, :operations, :resource

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


  end

end