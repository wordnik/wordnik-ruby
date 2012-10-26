module Wordnik

  # the simple idea here of a load balancer is to keep a set of hosts
  # around, and use the 'best' one. At Wordnik, we have a set of
  # API hosts available to us (these servers are invisible to the general web)
  # The class below implements least recently used.
  #
  # The Wordnik Configuration object will convert a :hosts specification
  # into a LoadBalancer instance
  #

  #
  # These should be thread safe.
  class LoadBalancer

    attr_reader :hosts
    attr_accessor :all_hosts
    attr_accessor :failed_hosts_table
    def initialize(hosts)
      @all_hosts = hosts
      @hosts = @all_hosts
      @failed_hosts_table = {}
    end

    def host
      h = hosts.first
      @hosts.rotate!
      restore_failed_hosts_maybe
      h
    end

    def inform_failure(host)
        #Wordnik.logger.debug "Informing failure about #{host}. table: #{@failed_hosts_table.inspect}"
      if @failed_hosts_table.include?(host)
        failures, failed_time = @failed_hosts_table[host]
        @failed_hosts_table[host] = [failures+1, failed_time]
      else
        @failed_hosts_table[host] = [1, Time.now.to_f] # failure count, first failure time
      end
      #Wordnik.logger.debug "Informed failure about #{host}. table now: #{@failed_hosts_table.inspect}"
      @hosts.delete(host)
      @hosts = [host] if @hosts.size == 0 # got to have something!
    end

    # success here means just that a successful connection was made
    # and the website didn't time out.
    def inform_success(host)
      @failed_hosts_table.delete(host)
      @hosts << host unless @hosts.include? host
      @hosts
    end

    def restore_failed_hosts_maybe
      @failed_hosts_table.each do |host, pair|
        failures, failed_time = pair
        seconds_since_first_failure = (Time.now.to_f - failed_time)
        #Wordnik.logger.debug "Seconds since #{host}'s first failure: #{seconds_since_first_failure} compared to #{2**(failures-1)}"
        # exponential backoff, but try every hour...
        if (seconds_since_first_failure > [3600, 2**(failures-1)].min)
          @hosts << host # give it a chance to succeed ...
          #Wordnik.logger.debug "Added #{host} to @hosts; now: #{@hosts}"
        end
      end
    end
  end

end
