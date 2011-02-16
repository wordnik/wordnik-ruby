# To jog the memory: Resource > Endpoint > Operation > OperationParameter
require 'active_model'
class Endpoint

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :path, :description, :operations
  
  validates_presence_of :path, :description, :operations
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name.to_s.underscore.to_sym}=", value)
    end
    
    # Generate Operations instances from JSON
    if self.operations
      self.operations = self.operations.map do |operationData|
        Operation.new(operationData)
      end
    end
  end

  # It's an ActiveModel thing..
  def persisted?
    false
  end

end