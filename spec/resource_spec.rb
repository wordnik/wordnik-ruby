require 'spec_helper'

describe Wordnik::Resource do

  before(:each) do
    @default_params = {
      :name => "word",
      :raw_data => JSON.parse(sample_resource_body)
    }

    @resource = Wordnik::Resource.new(@default_params)
  end

  describe "initialization" do

    it "successfully initializes" do
      @resource.name.should == "word"
    end

    it "sets endpoints" do
      @resource.endpoints.size.should >= 10
      @resource.endpoints.first.class.should == Wordnik::Endpoint
    end

    it "defines a method for each operation nickname" do
      @resource.public_methods.should include(:get_word)
      @resource.public_methods.should include(:get_definitions)
      @resource.public_methods.should include(:get_word_of_the_day)
      @resource.public_methods.should_not include(:get_busy)
    end

  end

  describe "auto-generated methods" do

    before(:each) do
      configure_wordnik
      #VCR.use_cassette('wordnik_authenticate', :record => :new_episodes) do
      #  Wordnik.authenticate
      #end
    end

    it "builds requests but doesn't run them if :request_only is passed" do
      @request = Wordnik.word.get_word('dynamo', :request_only => true)
      @request.class.should == Wordnik::Request
    end

    it "runs requests and returns their body if :request_only is absent" do
      #VCR.use_cassette('get_word_dynamo', :record => :new_episodes) do
        @response_body = Wordnik.word.get_word('dynamo')
      #end
      @response_body.class.should == Hash
      @response_body.keys.sort.should == %w(canonicalForm id lookupCount scrabble word)
    end

    it "allows the same auto-generated method to be called with different parameters" do
      request1 = Wordnik.word_list.get_word_list_by_id('dog', :request_only => true)
      request2 = Wordnik.word_list.get_word_list_by_id('cat', :request_only => true)
      request1.path.should_not == request2.path
    end

    context "argument handling" do

      before(:each) do
         @request = Wordnik.word.get_examples('dynamo', :skip => 2, :limit => 10, :request_only => true)
       end

       it "injects required arguments into the path" do
         @request.path.should == "/word/dynamo/examples"
       end

       it "passes optional key-value arguments to the query string" do
         @request.query_string.should == "?limit=10&skip=2"
       end

       it "puts key-value arguments in the request body instead of the query params for POSTs and PUTs" do
         body = {
           :name => "Wordnik Ruby Test List #{RAND}",
           :description => 'This is created by the test suite.',
           :type => 'PUBLIC',
           :user_id => Wordnik.configuration.user_id,
           :request_only => true
         }
         @request = Wordnik.word_lists.create_word_list(body, :request_only => true)
         @request.body.should have_key(:name)
         @request.body.should have_key(:description)
         @request.body.should have_key(:type)
         @request.body.should have_key(:userId)
       end

    end

    context "response transmogrification" do

      it "converts definitions response into an array of definition objects" #do
        #defs = Wordnik.word.get_definitions('set')
        #defs.should be_an(Array)
        #defs.first.should be_a(Wordnik::Definition)
      #end

    end

  end

end
