module Wordnik

  class OperationParameter
    require 'active_model'
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :name, :description, :required, :param_type, :default_value, :allowable_values, :param_access, :internal_description, :wrapper_name, :data_type, :allow_multiple

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name.to_s.underscore.to_sym}=", value)
      end
      
      # Fudge body param into having the name :body      
      self.name = :body if self.name.blank?
    end

    def human_name
      return "request body" if self.param_type == 'body'
      self.name.to_s
    end

    def required?
      self.required || self.param_type == "path"
    end
    
    # Is this a required positional param used in a convenience method?
    def positional?
      return true if self.param_type == 'body'
      return true if self.param_type == 'path' && self.name.to_s != 'format'
      false
    end

    # It's an ActiveModel thing..
    def persisted?
      false
    end

  end

end