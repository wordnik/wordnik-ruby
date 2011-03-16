require 'spec_helper'

describe Wordnik::Request do

  before(:each) do
    @default_http_method = :get
    @default_path = "words/fancy"
    @default_params = {
      :params => {:foo => "1", :bar => "2"}
    }
    @request = Wordnik::Request.new(@default_http_method, @default_path, @default_params)
  end

  describe "initialization" do
    it "sets default response format to json" do
      @request.format.should == "json"
    end

    it "gets default host from Wordnik.configuration" do
      @request.host.should == Wordnik.configuration.base_uri
    end
    
    it "allows params to be nil" do
      @request = Wordnik::Request.new(@default_http_method, @default_path, :params => nil)
      @request.query_string.should == ""
    end

  end

  describe "attr_accessors" do

    it "has working attributes" do
      @request.host.should == Wordnik.configuration.base_uri
      @request.path.should == "words/fancy"
    end

    it "allows attributes to be overwritten" do
      @request.http_method.should == :get
      @request.http_method = "post"
      @request.http_method.should == 'post'
    end

  end

  describe "url" do

    it "constructs a base URL" do
      @request.url.should == "http://beta.wordnik.com/v4/words.json/fancy"
    end

    it "constructs a query string" do
      @request.query_string.should == "?bar=2&foo=1"
    end

    it "constructs a full url" do
      @request.url_with_query_string.should == "http://beta.wordnik.com/v4/words.json/fancy?bar=2&foo=1"
    end

    it "accounts for excessive slashes" do
      @request = Wordnik::Request.new(:get, "andBurn", @default_params.merge({
        :host => "slash.com/"
      }))
      @request.url.should == "http://slash.com/andBurn.json"
    end

  end

  describe "path" do

    it "accounts for a total absence of format in the path string" do
      @request = Wordnik::Request.new(:get, "/word/{word}/entries", @default_params.merge({
        :format => "xml",
        :params => {
          :word => "cat"
        }
      }))
      @request.url.should == "http://beta.wordnik.com/v4/word.xml/cat/entries"
    end

    it "does string substitution on path params" do
      @request = Wordnik::Request.new(:get, "/word.{format}/{word}/entries", @default_params.merge({
        :format => "xml",
        :params => {
          :word => "cat"
        }
      }))
      @request.url.should == "http://beta.wordnik.com/v4/word.xml/cat/entries"
    end

    it "leaves path-bound params out of the query string" do
      @request = Wordnik::Request.new(:get, "/word.{format}/{word}/entries", @default_params.merge({
        :params => {
          :word => "cat",
          :limit => 20
        }
      }))
      @request.query_string.should == "?limit=20"
    end

    it "returns a question-mark free (blank) query string if no query params are present" do
      @request = Wordnik::Request.new(:get, "/word.{format}/{word}/entries", @default_params.merge({
        :params => {
          :word => "cat",
        }
      }))
      @request.query_string.should == ""
    end

    it "removes blank params" do
      @request = Wordnik::Request.new(:get, "words/fancy", @default_params.merge({
        :params => {
          :word => "dog",
          :limit => "",
          :foo => "criminy"
        }
      }))
      @request.query_string.should == "?foo=criminy&word=dog"
    end

    it "URI encodes the path" do
      @request = Wordnik::Request.new(:get, "word.{format}/{word}/definitions", @default_params.merge({
        :params => {
          :word => "bill gates"
        }
      }))
      @request.url.should =~ /word.json\/bill\%20gates\/definitions/
    end

    it "converts numeric params to strings" do
      @request = Wordnik::Request.new(@default_http_method, @default_path, @default_params.merge({
        :params => {
          :limit => 100
        }
      }))

      @request.interpreted_path.should_not be_nil
      @request.query_string.should =~ /\?limit=100/
      @request.url_with_query_string.should =~ /\?limit=100/
    end
    
    it "camelCases parameters" do
      @request = Wordnik::Request.new(@default_http_method, @default_path, @default_params.merge({
        :params => {
          :bad_dog => 'bud',
          :goodDog => "dud"
        }
      }))
      @request.query_string.should == "?badDog=bud&goodDog=dud"
    end
    
  end
  
  describe "API key" do
    
    it "is inferred from the Wordnik base configuration by default" do
      Wordnik.configure {|c| c.api_key = "xyz" }
      Wordnik::Request.new(:get, "word/json").headers[:api_key].should == "xyz"
    end
    
    it "gets obfuscated for public display" do
      @request = Wordnik::Request.new(:get, "words/fancy", @default_params.merge({
        :params => {
          :word => "dog",
          :api_key => "123456"
        }
      }))
      @request.query_string_params.should == {:word => "dog", :api_key => "123456"}
      @request.query_string_params(true).should == {:word => "dog", :api_key => "YOUR_API_KEY"}

      @request.query_string.should == "?api_key=123456&word=dog"
      @request.query_string(:obfuscated => true).should == "?api_key=YOUR_API_KEY&word=dog"

      @request.url_with_query_string.should =~ /123456/
      @request.url_with_query_string(:obfuscated => true).should =~ /YOUR\_API\_KEY/
    end

    it "allows a key in the params to override the configuration-level key, even if it's blank" do
      Wordnik.configure {|c| c.api_key = "abc" }
      @request_with_key = Wordnik::Request.new(:get, "word/json", :params => {:api_key => "jkl"})
      @request_with_key.headers[:api_key].should be_nil
      @request_with_key.params[:api_key].should == "jkl"
      
      @request_without_key = Wordnik::Request.new(:get, "word/json", :params => {:api_key => nil})
      @request_without_key.headers[:api_key].should be_nil
      @request_without_key.params[:api_key].should be_nil
    end

    it "allows a key in the headers to override the configuration-level key, even if it's blank" do
      Wordnik.configure {|c| c.api_key = "hij" }
      Wordnik::Request.new(:get, "word/json").headers[:api_key].should == "hij"
      Wordnik::Request.new(:get, "word/json", :headers => {:api_key => "jkl"}).headers[:api_key].should == "jkl"
      Wordnik::Request.new(:get, "word/json", :headers => {:api_key => nil}).headers[:api_key].should be_nil
    end

  end

end