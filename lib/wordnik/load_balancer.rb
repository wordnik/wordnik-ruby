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
    attr_accessor :current_host

    def initialize(hosts)
      @all_hosts = hosts
      @hosts = @all_hosts
      @failed_hosts_table = {}
      @current_host = nil
    end

    def host
      @current_host = hosts.first
      @hosts.rotate!
      restore_failed_hosts_maybe
      @current_host
    end

    def inform_failure
        #Wordnik.logger.debug "Informing failure about #{@current_host}. table: #{@failed_hosts_table.inspect}"
      if @failed_hosts_table.include?(@current_host)
        failures, failed_time = @failed_hosts_table[@current_host]
        @failed_hosts_table[@current_host] = [failures+1, failed_time]
      else
        @failed_hosts_table[@current_host] = [1, Time.now.to_f] # failure count, first failure time
      end
      #Wordnik.logger.debug "Informed failure about #{@current_host}. table now: #{@failed_hosts_table.inspect}"
      @hosts.delete(@current_host)
      @hosts = [@current_host] if @hosts.size == 0 # got to have something!
    end

    # success here means just that a successful connection was made
    # and the website didn't time out.
    def inform_success
      @failed_hosts_table.delete(@current_host)
      @hosts << @current_host unless @hosts.include? @current_host
      @hosts
    end

    def restore_failed_hosts_maybe
      return if @failed_hosts_table.size == 0
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
