require 'spec_helper'

describe Resource do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://api.wordnik.com/v4/word.json")
    end
    
    @default_params = {
      :name => "word",
      :raw_data => JSON.parse(@response.body)
    }
    
    @resource = Resource.new(@default_params)
  end

  describe "initialization" do

    it "successfully initializes" do
      @resource.name.should == "word"
    end
    
    it "sets endpoints" do
      @resource.endpoints.size.should == 10
      @resource.endpoints.first.class.to_s.should == "Endpoint"
    end
        
  end
  
end