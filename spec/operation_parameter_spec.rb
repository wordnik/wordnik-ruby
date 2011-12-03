require 'spec_helper'

describe Wordnik::OperationParameter do

  before(:each) do
    @operation_parameter = Wordnik::OperationParameter.new(JSON.parse(sample_resource_body)['apis'].first['operations'].first['parameters'].first)
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

  context "human_name" do
    it "is inferred from name" do
      @operation_parameter.should_receive(:param_type).and_return('path')
      @operation_parameter.human_name.should == @operation_parameter.name
    end
  
    it "is made more descriptive when it's the actual body of the request" do
      @operation_parameter.should_receive(:param_type).and_return('body')
      @operation_parameter.human_name.should == 'request body'
    end
  end
  
  it "is required if it's a path param" do
    @operation_parameter.should_receive(:required).and_return(false)
    @operation_parameter.should_receive(:param_type).and_return('path')
    @operation_parameter.required?.should == true
  end

  it "is positional if it's a body param" do
    @operation_parameter.should_receive(:param_type).and_return('body')
    @operation_parameter.positional?.should == true
  end

  it "is positional if it's a path param (except for 'format')" do
    @operation_parameter.should_receive(:param_type).at_least(:once).and_return('path')
    @operation_parameter.should_receive(:name).and_return('coolness')
    @operation_parameter.positional?.should == true
  end

end