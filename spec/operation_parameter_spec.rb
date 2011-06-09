require 'spec_helper'

describe Wordrabbit::OperationParameter do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://beta.wordnik.com/v4/word.json")
    end

    @operation_parameter = Wordrabbit::OperationParameter.new(JSON.parse(@response.body)['endPoints'].first['operations'].first['parameters'].first)
  end

  it "initializes" do
    @operation_parameter.should respond_to(:name)
    @operation_parameter.should respond_to(:description)
    @operation_parameter.should respond_to(:required)
    @operation_parameter.should respond_to(:param_type)
    @operation_parameter.should respond_to(:default_value)
    @operation_parameter.should respond_to(:allowable_values)
    @operation_parameter.should respond_to(:param_access)
  end
    
  it "has a human name"
  
  it "detects if its allowable values are delimited as an array"
  
  it "is required if it's part of the path"
  
  it "is positional if it's part of the path"

end