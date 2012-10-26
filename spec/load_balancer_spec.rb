require 'spec_helper'

describe Wordnik::LoadBalancer do
	before(:each) do
		@hosts = ["alpha","beta","gamma","delta"].map{|x| "#{x}.wordnik.com"}
	end

	describe "Basic Load Balancer" do
    it "allows creation with a list of hosts" do
     	lb = Wordnik::LoadBalancer.new(@hosts)
     	host, lb = lb.next
     	@hosts.should include(host)
    end

    it "returns different (random) hosts" do
    	lb = Wordnik::LoadBalancer.new(@hosts)
    	counts = Hash.new(0)
    	1.upto(1000) do
    		host, lb = lb.next
    		counts[host] += 1
    	end
    	@hosts.each {|host| counts[host].should > 10}
    end

    it "should not leak memory" do
  		#FIXME
  	end

  end

  describe "LRU Load Balancer" do
  	it "allows creation of a LRU load balancer" do
  		lb = Wordnik::LeastRecentlyUsedLoadBalancer.new(@hosts)
     	host, lb = lb.next
     	@hosts.should include(host)
  	end

  	it "returns the hosts in order" do
  		lb = Wordnik::LeastRecentlyUsedLoadBalancer.new(@hosts)
  		@hosts.each do |host|
  			next_host, lb = lb.next
  			next_host.should be host
  		end
  		@hosts.each do |host|
  			next_host, lb = lb.next
  			next_host.should be host
  		end
  		@hosts.each do |host|
  			next_host, lb = lb.next
  			next_host.should be host
  		end
  	end

  	it "should not leak memory" do
  		#FIXME
  	end
  end

  describe "LFU Load Balancer" do
  it "allows creation of a LRU load balancer" do
  		lb = Wordnik::LeastFrequentlyUsedLoadBalancer.new(@hosts)
     	host, lb = lb.next
     	@hosts.should include(host)
  	end

  	it "returns the hosts in order" do
  		lb = Wordnik::LeastFrequentlyUsedLoadBalancer.new(@hosts)
  		@hosts.each do |host|
  			next_host, lb = lb.next
  			next_host.should be host
  		end
  		@hosts.each do |host|
  			next_host, lb = lb.next
  			next_host.should be host
  		end
  		@hosts.each do |host|
  			next_host, lb = lb.next
  			next_host.should be host
  		end
  	end

  	it "should be stateless" do
  	lb = Wordnik::LeastFrequentlyUsedLoadBalancer.new(@hosts)
  	lb_1 = lb.next[1].next[1].next[1].next[1].next[1].next[1]
  	lb_2 = lb.next[1].next[1].next[1].next[1].next[1].next[1]
  	lb_1.counts.should eq lb_2.counts
  	end

  	it "should not leak memory" do
  		#FIXME
  	end
  end
end
