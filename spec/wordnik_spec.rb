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

      before(:each) do
        Wordnik.clear_configuration
      end

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

      context 'hosts' do
        it 'removes http from hosts' do
          Wordnik.configure {|c| c.hosts = ['http://example.com'] }
          Wordnik.configuration.hosts.should == ['example.com']
        end

        it 'removes https from hosts' do
          Wordnik.configure {|c| c.hosts = ['https://wookiee.com'] }
          Wordnik.configuration.hosts.should == ['wookiee.com']
        end

        it 'removes trailing path from hosts' do
          Wordnik.configure {|c| c.hosts = ['hobo.com/v4'] }
          Wordnik.configuration.hosts.should == ['hobo.com']
        end

        it 'creates a load balancer from hosts' do
          Wordnik.configure {|c| c.hosts = ['hobo.com'] }
          Wordnik.configuration.load_balancer.class.should == Wordnik::LoadBalancer
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
        Wordnik.clear_configuration
        configure_wordnik
        #VCR.use_cassette('wordnik_authenticate', :record => :new_episodes) do
          Wordnik.authenticate
        #end
        Wordnik.authenticated?.should == true
      end

      it 'de_authenticates' do
        Wordnik.clear_configuration
        configure_wordnik
        #VCR.use_cassette('wordnik_authenticate', :record => :new_episodes) do
          Wordnik.authenticate
        #end
        Wordnik.authenticated?.should == true
        Wordnik.de_authenticate
        Wordnik.authenticated?.should == false
      end

      it 'fails if credentials are invalid' do
        Wordnik.de_authenticate
        Wordnik.configure do |config|
          c = Wordnik.configuration.clone
          config.api_key = c.api_key
          config.username = c.username
          config.password = "wrong!"
          config.host = c.host
          config.base_path = c.base_path
        end

        #VCR.use_cassette('wordnik_authenticate_fail', :record => :new_episodes) do
          expect { Wordnik.authenticate }.to raise_error(ClientError)
        #end

        Wordnik.authenticated?.should == false
        configure_wordnik
      end

      it 'fails if username and/or password are absent' do
        Wordnik.de_authenticate
        Wordnik.configure do |config|
          c = Wordnik.configuration.clone
          config.api_key = c.api_key
          config.username = c.username
          config.password = nil
          config.host = c.host
          config.base_path = c.base_path
        end
        expect { Wordnik.authenticate }.to raise_error(ClientError, /username and password are required/i)
        Wordnik.authenticated?.should == false
        configure_wordnik
      end

    end

  end

  it 'maps shorthand Wordnik.resource calls to their resources' do
    Wordnik.word.class.should == Wordnik::Resource
    Wordnik.word.name.should == :word
  end

end
