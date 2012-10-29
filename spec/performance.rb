require 'spec_helper'
require 'ruby-prof'

describe "Load Balancer Performance" do

	describe "With single host -- host performance" do
		Wordnik.configuration.clear
		Wordnik.configure do |config|
    	config.api_key = CREDENTIALS[:api_key]
    	config.username = CREDENTIALS[:username]
    	config.password = CREDENTIALS[:password]
    	config.logger = Logger.new('/dev/null')
    	config.host = CREDENTIALS[:host] = 'api.wordnik.com'
    	config.hosts = []
    	config.base_path = CREDENTIALS[:base_path] || '/v4'
  	end
		start_time = Time.now
  	RubyProf.start
  	100000.times {|i| host = Wordnik.configuration.host}
  	result = RubyProf.stop
  	printer = RubyProf::FlatPrinter.new(result)
		printer.print(STDOUT)
	end

	describe "With multiple hosts -- host performance" do
		Wordnik.configuration.clear
		Wordnik.configure do |config|
    	config.api_key = CREDENTIALS[:api_key]
    	config.username = CREDENTIALS[:username]
    	config.password = CREDENTIALS[:password]
    	config.logger = Logger.new('/dev/null')
    	config.host = CREDENTIALS[:host] = 'api.wordnik.com'
    	config.hosts = CREDENTIALS[:hosts] || ['ec2-50-18-25-12.us-west-1.compute.amazonaws.com',' ec2-50-18-67-92.us-west-1.compute.amazonaws.com']
    	config.base_path = CREDENTIALS[:base_path] || '/v4'
  	end
		start_time = Time.now
  	RubyProf.start
  	100000.times {|i| host = Wordnik.configuration.host}
  	result = RubyProf.stop
  	printer = RubyProf::FlatPrinter.new(result)
		printer.print(STDOUT)
	end

end

 describe "Wordnik GET performance" do

 	describe "With single host" do
	 	RubyProf.start
	 	Wordnik.configuration.clear
		Wordnik.configure do |config|
    	config.api_key = CREDENTIALS[:api_key]
    	config.username = CREDENTIALS[:username]
    	config.password = CREDENTIALS[:password]
    	config.logger = Logger.new('/dev/null')
    	config.host = CREDENTIALS[:host] = 'api.wordnik.com'
    	config.hosts = []
    	config.base_path = CREDENTIALS[:base_path] || '/v4'
  	end
	 	words = File.open(File.dirname(__FILE__) + "/100words.txt").readlines.map{|w| w.strip}
	 	start_time = Time.now
	 	Wordnik.logger.debug "Starting at #{start_time}"
	 	found = 0
	 	defs = 0
	 	examples = 0
	 	words.each do |word|
	 		found += 1 if Wordnik.word.get_word(word)["id"]==0
	 		defs += Wordnik.word.get_definitions(word).size
	 		examples += Wordnik.word.get_examples(word).size
	 	end
	 	total = Time.now - start_time
	 	result = RubyProf.stop
	 	STDOUT.puts "Found #{found} words out of #{words.size}; #{defs} definitions; #{examples} examples in #{total} seconds"
	 	printer = RubyProf::FlatPrinter.new(result)
	 	printer.print(STDOUT)
 	end

 	describe "With two hosts" do
	 	RubyProf.start
	 	Wordnik.configuration.clear
		Wordnik.configure do |config|
    	config.api_key = CREDENTIALS[:api_key]
    	config.username = CREDENTIALS[:username]
    	config.password = CREDENTIALS[:password]
    	config.logger = Logger.new('/dev/null')
    	config.host = CREDENTIALS[:host] = 'api.wordnik.com'
    	config.hosts = CREDENTIALS[:hosts] || ['ec2-50-18-25-12.us-west-1.compute.amazonaws.com',' ec2-50-18-67-92.us-west-1.compute.amazonaws.com']
    	config.base_path = CREDENTIALS[:base_path] || '/v4'
  	end
	 	words = File.open(File.dirname(__FILE__) + "/100words.txt").readlines.map{|w| w.strip}
	 	start_time = Time.now
	 	Wordnik.logger.debug "Starting at #{start_time}"
	 	found = 0
	 	defs = 0
	 	examples = 0
	 	words.each do |word|
	 		found += 1 if Wordnik.word.get_word(word)["id"]==0
	 		defs += Wordnik.word.get_definitions(word).size
	 		examples += Wordnik.word.get_examples(word).size
	 	end
	 	total = Time.now - start_time
	 	result = RubyProf.stop
	 	STDOUT.puts "Found #{found} words out of #{words.size}; #{defs} definitions; #{examples} examples in #{total} seconds"
	 	printer = RubyProf::FlatPrinter.new(result)
	 	printer.print(STDOUT)
 	end

describe "With three hosts -- one invalid" do
	 	RubyProf.start
	 	Wordnik.configuration.clear
		Wordnik.configure do |config|
    	config.api_key = CREDENTIALS[:api_key]
    	config.username = CREDENTIALS[:username]
    	config.password = CREDENTIALS[:password]
    	config.logger = Logger.new('/dev/null')
    	config.host = CREDENTIALS[:host] = 'api.wordnik.com'
    	config.hosts = CREDENTIALS[:hosts] || ['ec2-50-18-25-12.us-west-1.compute.amazonaws.com',
    																					'ec2-50-18-67-92.us-west-1.compute.amazonaws.com',
    																				  'localhost']
    	config.base_path = CREDENTIALS[:base_path] || '/v4'
  	end
	 	words = File.open(File.dirname(__FILE__) + "/100words.txt").readlines.map{|w| w.strip}
	 	start_time = Time.now
	 	Wordnik.logger.debug "Starting at #{start_time}"
	 	found = 0
	 	defs = 0
	 	examples = 0
	 	words.each do |word|
	 		found += 1 if Wordnik.word.get_word(word)["id"]==0
	 		defs += Wordnik.word.get_definitions(word).size
	 		examples += Wordnik.word.get_examples(word).size
	 	end
	 	total = Time.now - start_time
	 	result = RubyProf.stop
	 	STDOUT.puts "Found #{found} words out of #{words.size}; #{defs} definitions; #{examples} examples in #{total} seconds"
	 	printer = RubyProf::FlatPrinter.new(result)
	 	printer.print(STDOUT)
 	end

 end
