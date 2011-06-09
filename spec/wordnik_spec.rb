# require 'spec_helper'
require File.dirname(__FILE__) + '/spec_helper'

describe Wordrabbit do

  before(:each) do
    configure_wordrabbit
  end
  
  after(:each) do
  end

  context "initialization" do

    context "resources" do
      it "instantiates resources from cached JSON" do
        Wordrabbit.resources.class.should == Hash
        Wordrabbit.resources[:word].class.should == Wordrabbit::Resource
      end
      
      it "has as many resources as there are resource names" do
        Wordrabbit.resources.size.should == Wordrabbit.configuration.resource_names.size
      end

      it "assigns resource keys that match the resource names" do
        Wordrabbit.resources[:word].name.should == :word 
      end

    end
    
    context "authentication" do
      
      before(:each) do
      end
      
      it "auto-authenticates at load time if username and password are present"
      
      it "succeeds if a username and password are present in the configuration" do
        Wordrabbit.authenticate
        Wordrabbit.authenticated?.should == true
      end
      
      it "de_authenticates" do
        Wordrabbit.authenticate
        Wordrabbit.authenticated?.should == true
        Wordrabbit.de_authenticate
        Wordrabbit.authenticated?.should == false
      end
      
      it "fails if credentials are invalid" do
        Wordrabbit.de_authenticate
        Wordrabbit.configure do |config|
          config.api_key = CREDENTIALS[:api_key]
          config.username = CREDENTIALS[:username]
          config.password = 'wrong!'
          config.base_uri = "beta.wordnik.com/v4"
        end
        lambda { Wordrabbit.authenticate }.should raise_error(ApiServerError)
        Wordrabbit.authenticated?.should == false
      end
      
      it "fails if username and/or password are absent" do
        Wordrabbit.de_authenticate
        Wordrabbit.configure do |config|
          config.api_key = CREDENTIALS[:api_key]
          config.username = nil
          config.password = nil
          config.base_uri = "beta.wordnik.com/v4"
        end
        lambda { Wordrabbit.authenticate }.should raise_error(ConfigurationError, /username and password are required/i)
        Wordrabbit.authenticated?.should == false
      end
      
    end
    
  end
  
  it "maps shorthand Wordrabbit.resource calls to their resources" do
    Wordrabbit.word.class.should == Wordrabbit::Resource
    Wordrabbit.word.name.should == :word
  end  
  
end