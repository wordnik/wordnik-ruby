require 'spec_helper'

describe "Wordnik performance" do
	configure_wordnik
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
	Wordnik.logger.debug "Found #{found} words out of #{words.size}; #{defs} definitions; #{examples} examples in #{total} milliseconds"
end
