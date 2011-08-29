require 'spec_helper'

describe Wordnik::Endpoint do

  before(:each) do
    @resource = Wordnik::Resource.new(:name => "word", :raw_data => JSON.parse(sample_resource_body))
    @endpoint = @resource.endpoints.first
  end

  describe "initialization" do

    it "successfully initializes" do
      @endpoint.path.should =~ /word\.{format}\/{word}/i
    end

    it "sets operations" do
      @endpoint.operations.class.should == Array
      @endpoint.operations.first.class.should == Wordnik::Operation
    end

  end

end