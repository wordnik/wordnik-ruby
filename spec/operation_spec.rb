require 'spec_helper'

describe Operation do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://api.wordnik.com/v4/word.json")
    end
    
    @operation = Operation.new(JSON.parse(@response.body)['endPoints'].first['operations'].first)
  end

  describe "initialization" do

    it "successfully initializes" do
      @operation.summary.should =~ /returns the WordObject/i
    end
    
    it "sets parameters" do
      @operation.parameters.class.should == Array
      @operation.parameters.first.class.should == OperationParameter
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
  
end