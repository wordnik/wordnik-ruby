require 'spec_helper'

describe Wordrabbit::Operation do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://beta.wordnik.com/v4/word.json")
    end
    @resource = Wordrabbit::Resource.new(:name => "word", :raw_data => JSON.parse(@response.body))
    @endpoint = @resource.endpoints.first
    @operation = @endpoint.operations.first
  end

  describe "initialization" do

    it "successfully initializes" do
      @operation.summary.should =~ /returns the WordObject/i
    end

    it "sets parameters" do
      @operation.parameters.class.should == Array
      @operation.parameters.first.class.should == Wordrabbit::OperationParameter
    end

  end

  describe "instance methods" do
    it "knows if its HTTP method is GET" do
      @operation.http_method = "GET"
      @operation.get?.should == true
      @operation.http_method = "POST"
      @operation.get?.should == false
      @operation.http_method = "get"
      @operation.get?.should == true
    end
  end
  
  describe "positional parameter names" do
    
    it "returns an empty array if there are no parameters" do
      @operation.positional_parameter_names.should == ['word']
      @operation.parameters = []
      @operation.positional_parameter_names.should == []
    end
    
  end

end