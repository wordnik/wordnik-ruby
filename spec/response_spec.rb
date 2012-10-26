require 'spec_helper'

describe Wordnik::Response do

  before(:each) do

    #VCR.use_cassette('word_resource', :record => :new_episodes) do
      @raw = Typhoeus::Request.get("http://#{Wordnik.configuration.host}#{Wordnik.configuration.base_path}/word.json")
    #end

    @response = Wordnik::Response.new(@raw)
  end

  describe "initialization" do
    it "sets body" do
      @response.body.class.should == Hash
      @response.body.has_key?('apis').should == true
    end

    it "sets code" do
      @response.code.should == 200
    end

    it "converts header string into a hash" do
      @response.headers.class.should == Hash
      @response.headers['Wordnik-Api-Version'].to_s.should =~ /^4/
    end
  end

  describe "unauthorized" do
    it "raises an error when initialized" do
      #VCR.use_cassette('get_dog_images', :record => :new_episodes) do
        @unauthorized_raw = Typhoeus::Request.get("http://#{Wordnik.configuration.host}#{Wordnik.configuration.base_path}/word.json/dog/images/flickr")
        expect { Wordnik::Response.new(@unauthorized_raw) }.to raise_error(ClientError)
      #end
    end
  end

  describe "format" do

    it "recognizes json" do
      @response.format.should == 'json'
      @response.json?.should == true
    end

    it "recognizes xml" do
      #VCR.use_cassette('xml_response_request', :record => :new_episodes) do
        @raw = Typhoeus::Request.get("http://#{Wordnik.configuration.host}#{Wordnik.configuration.base_path}/word.xml")
      #end
      @response = Wordnik::Response.new(@raw)
      @response.format.should == 'xml'
      @response.xml?.should == true
    end

  end

  describe "prettiness" do

    it "has a pretty json body" do
      @response.pretty_body.should =~ /\{.*\}/
    end

    it "has a pretty XML body even in the face of adverse characters" do
      configure_wordnik
      #VCR.use_cassette('crazier_json_request', :record => :new_episodes) do
        @request = Wordnik::Request.new(:get, "word.xml/hero/pronunciations", :params => {:limit => 1})
        @response = @request.response
      #end
      @response.pretty_body.should =~ /\?xml/
    end

    it "has a pretty xml body" do
      #VCR.use_cassette('xml_response_request', :record => :new_episodes) do
        @raw = Typhoeus::Request.get("http://#{Wordnik.configuration.host}#{Wordnik.configuration.base_path}/word.xml")
      #end
      @response = Wordnik::Response.new(@raw)
      @response.pretty_body.should =~ /\?xml/
    end

    it "has pretty headers" do
      @response.pretty_headers.should =~ /\{.*\}/
    end

  end

end
