require 'spec_helper'

describe Wordnik::OperationParameter do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://api.wordnik.com/v4/word.json")
    end

    @operation_parameter = Wordnik::OperationParameter.new(JSON.parse(@response.body)['endPoints'].first['operations'].first['parameters'].first)
  end

  describe "initialization" do

    it "successfully initializes" do
      @operation_parameter.respond_to?(:name).should == true
      @operation_parameter.respond_to?(:description).should == true
      @operation_parameter.respond_to?(:required).should == true
      @operation_parameter.respond_to?(:param_type).should == true
      @operation_parameter.respond_to?(:default_value).should == true
      @operation_parameter.respond_to?(:allowable_values).should == true
    end

  end

end