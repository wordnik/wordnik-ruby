require 'spec_helper'

describe Wordnik::Response do

  before(:each) do

    VCR.use_cassette('default_response_request', :record => :new_episodes) do
      @raw = Typhoeus::Request.get("http://api.wordnik.com/v4/word.json")
    end

    @response = Wordnik::Response.new(@raw)
  end

  describe "initialization" do
    it "sets body" do
      @response.body.class.should == Hash
      @response.body.has_key?('endPoints').should == true
    end

    it "sets code" do
      @response.code.should == 200
    end

    it "converts header string into a hash" do
      @response.headers.class.should == Hash
      @response.headers['Wordnik-Api-Version'].to_s.should =~ /4\.0/
    end

  end

  describe "format" do

    it "recognizes json" do
      @response.format.should == :json
      @response.json?.should == true
    end

    it "recognizes xml" do
      VCR.use_cassette('xml_response_request', :record => :new_episodes) do
        @raw = Typhoeus::Request.get("http://api.wordnik.com/v4/word.xml/help")
      end
      @response = Wordnik::Response.new(@raw)
      @response.format.should == :xml
      @response.xml?.should == true
    end

  end

end