require 'spec_helper'

describe String do

  it "underscores" do
    "thisIsATest".underscore.should == "this_is_a_test"
  end
  
  describe "camelize" do
    
    it "supports uppercase first letter" do
      "camel_toe".camelize.should == "CamelToe"
    end

    it "supports lowercase first letter" do
      "camel_toe".camelize(:lower).should == "camelToe"
    end
    
  end
  
end