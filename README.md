wordnik rubygem
===============

This is the official Wordnik rubygem. It fully wraps Wordnik's v4 API. Refer to 
[developer.wordnik.com/docs](http://developer.wordnik.com/docs) to play around 
in the live API sandbox. All the methods you see there are implemented in this 
ruby gem.

Installation
------------

### Rails 3.x

Add the wordnik gem to your Gemfile.rb:

    gem 'wordnik'

Then from your project's RAILS_ROOT, run:

    bundle install

Create a file named config/initializers/wordnik.rb and drop this in:

	Wordnik.configure do |config|
		config.api_key = '12345abcde'			# required
		config.username = 'bozo'					# optional, but needed for user-related functions
		config.password = 'cl0wnt0wn'			# optional, but needed for user-related functions
		config.response_format = :json		# defaults to json, but xml is also supported
	end

### Rails 2.x

Add the wordnik gem to your app. In config/environment.rb:

    config.gem 'wordnik'

Then from your project's RAILS_ROOT, run:

    rake gems:install
    rake gems:unpack GEM=wordnik

Create config/initializers/wordnik.rb and drop this in:

	Wordnik.configure do |config|
		config.api_key = '12345abcde'
		config.response_format = :json # defaults to json, but xml is also supported
	end
	
### Sinatra/Padrino/Other

	gem install wordnik

Put this somewhere in your app's initialization process:

	Wordnik.configure do |config|
		config.api_key = '12345abcde'
		config.response_format = :json # defaults to json, but xml is also supported
	end
	
	
Usage
-----

	# The clean version..
	examples = Wordnik.word.get_examples('monkey', :limit => 50, :part_of_speech => 'verb')
	
	# ..and its low-level equivalent
	request = Wordnik::Request.new(:get, '/word/{word}/examples', :params => {:word => 'monkey', :limit => 50, :part_of_speech => 'verb'})
	examples = request.response.body
	
      request1 = Wordnik.word_list.get_word_list_by_id('dog', :request_only => true)

For a full list of methods, checkout [USAGE.md](https://github.com/wordnik/wordnik-ruby/blob/master/USAGE.md). The wordnik gem automatically generates its convenience methods by parsing the [Wordnik API documentation](http://developer.wordnik.com/docs).

Specs
-----

The wordnik gem uses rspec 2. To run the test suite, just type `rake` or `rake spec` in the gem's base directory.
	
Contributing
------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the [issue tracker](http://github.com/wordnik/wordnik-ruby/issues) to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for the feature/bugfix. This is important so we don't break it in a future version unintentionally.

Wishlist
--------

* Go Kart
* Helicopter

Props
-----

* Thanks to [Jason Adams](http://twitter.com/#!/ealdent) for graciously turning 
	over the [wordnik gem name](https://rubygems.org/gems/wordnik).
* HTTP requests are made using [Typhoeus](https://github.com/dbalatero/typhoeus), 
	a modern code version of the mythical beast with 100 serpent heads.