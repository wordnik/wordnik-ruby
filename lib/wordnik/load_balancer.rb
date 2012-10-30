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
      @all_hosts = hosts.clone
      @hosts = @all_hosts.clone
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
        @failed_hosts_table[@current_host] = [failures+1, Time.now.to_f]
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
        n = Time.now.to_f
        seconds_since_last_failure = (n - failed_time)
        # exponential backoff, but try every hour...
        if (seconds_since_last_failure > [3600, 2**(failures-1)].min)
          @hosts << host # give it a chance to succeed ...
          update_failed_time(host, n)
        end
      end
    end

    # mostly useful in mock testing...
    def update_failed_time(host, time=Time.now)
      if @failed_hosts_table.include? host
        failures, _ = @failed_hosts_table[host]
        @failed_hosts_table[host] = [failures, time.to_f]
      else
      @failed_hosts_table[host] = [1,time.to_f]
      end
    end
  end

end
