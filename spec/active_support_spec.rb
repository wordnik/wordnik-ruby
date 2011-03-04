require 'spec_helper'

describe String do

  it "underscores" do
    "thisIsATest".underscore.should == "this_is_a_test"
  end
  
  it "camelizes" do
    "camel_toe".camelize.should == "CamelToe"
  end
  
end