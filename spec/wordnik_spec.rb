require 'spec_helper'

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
        Wordnik.resources.size.should == Wordnik.resource_names.size
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
        lambda { Wordnik.authenticate }.should raise_error(ApiServerError)
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
  
  context "dynamic method_missing magic" do
    
    it "maps shorthand Wordnik.resource calls to their resources" do
      Wordnik.word.class.should == Wordnik::Resource
      Wordnik.word.name.should == :word
    end

    it "builds requests but doesn't run them if method name begins with 'build_'" do
      @request = Wordnik.word.build_get('dynamo')
      @request.class.should == Wordnik::Request
    end

    it "runs requests and returns their body if method name doesn't begin with 'build_'" do
      @response_body = Wordnik.word.get('dynamo')
      @response_body.class.should == Hash
      @response_body.keys.sort.should == %w(canonicalForm word)
    end
    
    context "argument handling" do

      before(:each) do
         @request = Wordnik.word.build_get_examples('dynamo', :skip => 2, :limit => 10)
       end
       
       it "injects required arguments into the path" do
         @request.path.should == "/word/dynamo/examples"
       end

       it "passes optional key-value arguments to the query string" do
         @request.query_string.should == "?limit=10&skip=2"
       end
       
       it "puts key-value arguments in the request body instead of the query params"
       
    end
    
    context "wordlists" do
      
      before do
        configure_wordnik
        Wordnik.authenticate        
      end
      
      it "creates a wordlist" do
        body = {
          :name=> "Wordnik Ruby Test List #{RAND}",
          :description => 'This is created by the test suite.',
          :type => 'PUBLIC',
          :user_id => Wordnik.configuration.user_id
        }
        request = Wordnik::Request.new(:post, "wordLists", :body => body)
        request.response.body.should be_a_kind_of(Hash)
        request.response.body.should have_key('permalink')
      end
      
      it "finds the new wordlist" do
        lists = Wordnik.account.get_word_lists
        permalinks = lists.map { |list| list['permalink'] }
        permalinks.should include("wordnik-ruby-test-list-#{RAND}")
      end

      it "finds the new wordlist and adds words to it"
      
      it "updates words"
      
      it "get all the words"
      
      it "deletes a wordlist"
      
    end
        
  end
  
end