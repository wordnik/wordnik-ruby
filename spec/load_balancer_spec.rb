require 'spec_helper'

describe Wordnik::LoadBalancer do
	before(:each) do
		@hosts = ["alpha","beta","gamma","delta"].map{|x| "#{x}.wordnik.com"}
	end

	describe "Load Balancer" do
    it "allows creation with a list of hosts" do
     	lb = Wordnik::LoadBalancer.new(@hosts)
     	h = lb.host
     	@hosts.should include(h)
    end

    it "returns different (random) hosts" do
    	lb = Wordnik::LoadBalancer.new(@hosts)
    	counts = Hash.new(0)
    	1.upto(1000) do
    		h = lb.host
    		counts[h] += 1
    	end
    	@hosts.each {|host| counts[host].should > 10}
    end

    it "should not leak memory"

  end
end
