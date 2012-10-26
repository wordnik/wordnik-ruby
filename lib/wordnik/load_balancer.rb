module Wordnik

  # the simple idea here of a load balancer is to keep a set of hosts
  # around, and use the 'best' one. At Wordnik, we have a set of
  # API hosts available to us (these servers are invisible to the general web)
  # The class below implements three strategies — least recently used,
  # random, and least frequently used.
  #
  # The Wordnik Configuration object will convert a :hosts specification
  # into LoadBalancer (which defaults to LRU)
  #
  # You can also specify an instance of RandomLoadBalancer or LeastFrequentlyUsedLoadBalancer
  # if you choose, or be picky and specify LeastRecentlyUsedLoadBalancer
  #
  # These should be thread safe.
  class LoadBalancer

    attr_reader :hosts

    def initialize(hosts)
      @hosts = hosts
    end

    def host
      hosts.first
    end

    def next
      [host, LoadBalancer.new(@hosts.rotate)]
    end
  end

  # default is LRU.
  class LeastRecentlyUsedLoadBalancer < LoadBalancer
  end

  class RandomLoadBalancer < LoadBalancer

    def next
      [host, RandomLoadBalancer.new(@hosts.shuffle)]
    end
  end

  # return the least frequently used. this is the most expensive
  # load balancer.
  class LeastFrequentlyUsedLoadBalancer < LoadBalancer
    attr_accessor :counts

    def initialize(hosts)
      @hosts = hosts
      @counts = hosts.map{|h| [h,0.0]}
    end

    def host
      @counts.min{|a,b| a[1] <=> b[1]}[0]
    end

    def next
      h = host
      n = LeastFrequentlyUsedLoadBalancer.new(@hosts)
      n.counts = @counts.map{|pr| pr.clone}
      pr = n.counts.assoc(h)
      pr[1] += 1.0
      [h,n]
    end
  end

end
