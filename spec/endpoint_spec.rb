require 'spec_helper'

describe Wordnik::Endpoint do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://beta.wordnik.com/v4/word.json")
    end
    @resource = Wordnik::Resource.new(:name => "word", :raw_data => JSON.parse(@response.body))
    @endpoint = @resource.endpoints.first
  end

  describe "initialization" do

    it "successfully initializes" do
      @endpoint.path.should == "/word.{format}/{word}"
    end

    it "sets operations" do
      @endpoint.operations.class.should == Array
      @endpoint.operations.first.class.should == Wordnik::Operation
    end

  end

end