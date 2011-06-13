# require 'spec_helper'
require File.dirname(__FILE__) + '/spec_helper'

describe Wordnik do

  before(:each) do
    configure_wordnik
  end
  
  after(:each) do
  end

  context "initialization" do

    context "resources" do
      it "instantiates resources from cached JSON" do
        Wordnik.resources.class.should == Hash
        Wordnik.resources[:word].class.should == Wordnik::Resource
      end
      
      it "has as many resources as there are resource names" do
        Wordnik.resources.size.should == Wordnik.configuration.resource_names.size
      end

      it "assigns resource keys that match the resource names" do
        Wordnik.resources[:word].name.should == :word 
      end

    end
    
    context "authentication" do
      
      before(:each) do
      end
      
      it "auto-authenticates at load time if username and password are present"
      
      it "succeeds if a username and password are present in the configuration" do
        Wordnik.authenticate
        Wordnik.authenticated?.should == true
      end
      
      it "de_authenticates" do
        Wordnik.authenticate
        Wordnik.authenticated?.should == true
        Wordnik.de_authenticate
        Wordnik.authenticated?.should == false
      end
      
      it "fails if credentials are invalid" do
        Wordnik.de_authenticate
        Wordnik.configure do |config|
          config.api_key = CREDENTIALS[:api_key]
          config.username = CREDENTIALS[:username]
          config.password = 'wrong!'
          config.base_uri = "beta.wordnik.com/v4"
        end
        lambda { Wordnik.authenticate }.should raise_error(AuthorizationError)
        Wordnik.authenticated?.should == false
      end
      
      it "fails if username and/or password are absent" do
        Wordnik.de_authenticate
        Wordnik.configure do |config|
          config.api_key = CREDENTIALS[:api_key]
          config.username = nil
          config.password = nil
          config.base_uri = "beta.wordnik.com/v4"
        end
        lambda { Wordnik.authenticate }.should raise_error(ConfigurationError, /username and password are required/i)
        Wordnik.authenticated?.should == false
      end
      
    end
    
  end
  
  it "maps shorthand Wordnik.resource calls to their resources" do
    Wordnik.word.class.should == Wordnik::Resource
    Wordnik.word.name.should == :word
  end  
  
end