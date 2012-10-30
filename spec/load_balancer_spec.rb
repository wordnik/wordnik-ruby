require 'spec_helper'
require 'objspace' # ruby 1.9, I think

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

    it "should not leak memory" do
      lb = Wordnik::LoadBalancer.new(@hosts)
      free = ObjectSpace.count_objects[:TOTAL]
      1000.times {h = lb.host}
      free.should == ObjectSpace.count_objects[:TOTAL]
    end

    describe "Success and failure modes" do
      it "allows for a failure" do
        lb = Wordnik::LoadBalancer.new(@hosts)
        h = lb.host
        lb.inform_failure
        lb.failed_hosts_table.size.should == 1
        lb.hosts.should_not include(h)
        lb.hosts.size.should == lb.all_hosts.size - 1
      end

      it "allows for two failures" do
        lb = Wordnik::LoadBalancer.new(@hosts)
        h1 = lb.host
        lb.inform_failure
        h2 = lb.host
        lb.inform_failure
        lb.failed_hosts_table.size.should == 2
        lb.hosts.should_not include(h1)
        lb.hosts.should_not include(h2)
        lb.hosts.size.should == lb.all_hosts.size - 2
      end

      it "should never leave hosts empty" do
        lb = Wordnik::LoadBalancer.new(@hosts)
        @hosts.size.times{h = lb.host; lb.inform_failure}
        lb.hosts.size.should == 1
      end

      it "allows for a subsequent success" do
        lb = Wordnik::LoadBalancer.new(@hosts)
        h = lb.host
        lb.inform_failure
        lb.inform_success
        lb.failed_hosts_table.size.should == 0
        lb.hosts.should include(h)
        lb.hosts.size.should == lb.all_hosts.size
      end

      it "does exponential back-off" do
        lb = Wordnik::LoadBalancer.new(@hosts)
        t = Time.now
        h = lb.host
        lb.inform_failure
        lb.update_failed_time(h, t)
        lb.update_failed_time(h, t-2) # pretend it happened two seconds ago
        lb.restore_failed_hosts_maybe
        lb.hosts.should include(h)
        lb.hosts.size.should == lb.all_hosts.size
        lb.inform_failure
        lb.inform_failure
        lb.update_failed_time(h, t-2) # pretend it happened two seconds ago
        lb.restore_failed_hosts_maybe
        lb.hosts.should_not include(h)
        lb.hosts.size.should == lb.all_hosts.size - 1
        lb.update_failed_time(h, t-4) # pretend it happened 4 seconds ago
        lb.restore_failed_hosts_maybe
        lb.hosts.should include(h)
        lb.hosts.size.should == lb.all_hosts.size
        # create a lot of failures
        1000.times {lb.inform_failure}
        lb.update_failed_time(h, t-((59*60)+59)) # pretend it happened 59:59 minutes ago
        lb.restore_failed_hosts_maybe
        lb.hosts.should_not include(h)
        lb.hosts.size.should == lb.all_hosts.size - 1
        lb.update_failed_time(h, t-(60*60)) # pretend it happened 1 hour ago
        lb.restore_failed_hosts_maybe
        lb.hosts.should include(h)
        lb.hosts.size.should == lb.all_hosts.size
        lb.inform_success
        lb.failed_hosts_table.size.should == 0
      end
    end
  end



end
