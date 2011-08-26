# require 'spec_helper'
require File.dirname(__FILE__) + '/spec_helper'

describe Wordnik do

  before(:each) do
    configure_wordnik
  end
  
  after(:each) do
  end

  context 'initialization' do
    
    context 'URL stuff' do

      context 'host' do
        it 'removes http from host' do
          Wordnik.configure {|c| c.host = 'http://example.com' } 
          Wordnik.configuration.host.should == 'example.com'
        end

        it 'removes https from host' do
          Wordnik.configure {|c| c.host = 'https://wookiee.com' } 
          Wordnik.configuration.host.should == 'wookiee.com'
        end

        it 'removes trailing path from host' do
          Wordnik.configure {|c| c.host = 'hobo.com/v4' } 
          Wordnik.configuration.host.should == 'hobo.com'
        end
      end
      
      context 'base_path' do
        it "prepends a slash to base_path" do
          Wordnik.configure {|c| c.base_path = 'v4/dog' } 
          Wordnik.configuration.base_path.should == '/v4/dog'
        end
        
        it "doesn't prepend a slash if one is already there" do
          Wordnik.configure {|c| c.base_path = '/v4/dog' }
          Wordnik.configuration.base_path.should == '/v4/dog'
        end
        
        it "ends up as a blank string if nil" do
          Wordnik.configure {|c| c.base_path = nil }
          Wordnik.configuration.base_path.should == ''
        end
        
      end

    end

    context 'resources' do
      it 'instantiates resources from cached JSON' do
        Wordnik.resources.class.should == Hash
        Wordnik.resources[:word].class.should == Wordnik::Resource
      end
      
      it 'has as many resources as there are resource names' do
        Wordnik.resources.size.should == Wordnik.configuration.resource_names.size
      end

      it 'assigns resource keys that match the resource names' do
        Wordnik.resources[:word].name.should == :word 
      end

    end
    
    context 'authentication' do
      
      before(:each) do
      end
      
      it 'auto-authenticates at load time if username and password are present'
      
      it 'succeeds if a username and password are present in the configuration' do
        Wordnik.authenticate
        Wordnik.authenticated?.should == true
      end
      
      it 'de_authenticates' do
        Wordnik.authenticate
        Wordnik.authenticated?.should == true
        Wordnik.de_authenticate
        Wordnik.authenticated?.should == false
      end
      
      it 'fails if credentials are invalid' do
        Wordnik.de_authenticate
        Wordnik.configure do |config|
          config.api_key = CREDENTIALS[:api_key]
          config.username = CREDENTIALS[:username]
          config.password = 'wrong!'
          config.host = 'beta.wordnik.com'
          config.base_path = '/v4'
        end
        expect { Wordnik.authenticate }.to raise_error(ClientError)
        Wordnik.authenticated?.should == false
      end
      
      it 'fails if username and/or password are absent' do
        Wordnik.de_authenticate
        Wordnik.configure do |config|
          config.api_key = CREDENTIALS[:api_key]
          config.username = nil
          config.password = nil
          config.host = 'beta.wordnik.com'
          config.base_path = '/v4'
        end
        expect { Wordnik.authenticate }.to raise_error(ClientError, /username and password are required/i)
        Wordnik.authenticated?.should == false
      end
      
    end
    
  end
  
  it 'maps shorthand Wordnik.resource calls to their resources' do
    Wordnik.word.class.should == Wordnik::Resource
    Wordnik.word.name.should == :word
  end  
  
end