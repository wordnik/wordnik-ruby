# To jog the memory: Resource > Endpoint > Operation > OperationParameter

class Resource

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
        Endpoint.new(endpointData)
      end
    end
  end
  
  def operation_nickname_pairs
    return unless self.endpoints.present?
    pairs = {}
    self.endpoints.map do |endpoint|
      endpoint.operations.map do |operation|
        nickname_parts = []
        nickname_parts << operation.http_method
        nickname_parts << endpoint.path.gsub(/\{\w+\}/, "").gsub("/", "_").nix(' ').nix('.').underscore
        nickname = nickname_parts.
          join("_").
          gsub(/_+/, "_").
          gsub("_#{self.name.underscore}", "").
          gsub(/_$/, "")
        pairs[nickname] = "#{operation.http_method.upcase} #{endpoint.path}"
      end
    end
    pairs
  end

  # It's an ActiveModel thing..
  def persisted?
    false
  end

end