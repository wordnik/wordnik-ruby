wordnik rubygem
===============

This is the official Wordnik rubygem. It fully wraps Wordnik's v4 API. Refer to 
[developer.wordnik.com/docs](http://developer.wordnik.com/docs) to play around 
in the live API sandbox. All the methods you see there are implemented in this 
ruby gem.

Installation
------------

```bash
gem install wordnik
```

Or, add the wordnik gem to your project's Gemfile.rb:

```ruby
gem 'wordnik'
```

Then from your project's root, run:

```bash
bundle
```

If you're using Wordnik in a rails app, drop this into `config/initializers/wordnik.rb`:

```ruby
Wordnik.configure do |config|
  config.api_key = '12345abcde'               # required
  config.username = 'bozo'                    # optional, but needed for user-related functions
  config.password = 'cl0wnt0wn'               # optional, but needed for user-related functions
  config.response_format = 'json'             # defaults to json, but xml is also supported
  config.logger = Logger.new('/dev/null')     # defaults to Rails.logger or Logger.new(STDOUT). Set to Logger.new('/dev/null') to disable logging.
end
```

Example Standalone Usage
------------------------

```ruby
%w(rubygems wordnik).each {|lib| require lib}

Wordnik.configure do |config|
	config.api_key = 'YOUR_API_KEY_HERE'
end

# Definitions
Wordnik.word.get_definitions('hysterical')
Wordnik.word.get_definitions('lemurs', :use_canonical => true)
Wordnik.word.get_definitions('fish', :part_of_speech => 'verb,noun')
Wordnik.word.get_definitions('scoundrel', :limit => 20, :source_dictionaries => "ahd,wiktionary,wordnet")

# Examples
Wordnik.word.get_examples('slovenly')
Wordnik.word.get_examples('wrangle', :limit => 10, :skip => 10) # pagination

# Related Words
Wordnik.word.get_related('sad', :type => 'synonym')
Wordnik.word.get_related('bowls', :type => 'hypernym', :use_canonical => true)

# Search
Wordnik.words.search_words(:query => 'dog')
Wordnik.words.search_words(:query => 'cal*', :min_dictionary_count => 3)
Wordnik.words.search_words(:query => '*tin*', :include_part_of_speech => 'verb', :min_length => 5, :max_length => 20)

```

For a full list of available methods, check out the [Wordnik API documentation](http://developer.wordnik.com/docs).
When you make a request using our web-based API sandbox, the response output will show you how to make the 
[equivalent ruby request](http://cl.ly/9FQY). w00t!

Specs
-----

The wordnik gem uses rspec 2. To run the test suite, just type `rake` or `bundle exec rake spec` in the gem's base directory.

Note
----
For testing locally, you will need to tunnel into the beta box:

```bash
alias tunnel='killall ssh; sleep 1; echo "tunneling anew..."; ssh -f -N -L 8001:localhost:8001 beta.wordnik.com'
```

And remember to update the spec_helper
	
Contributing
------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the [issue tracker](http://github.com/wordnik/wordnik-ruby/issues) to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for the feature/bugfix. This is important so we don't break it in a future version unintentionally.

Releasing
---------

```bash
rake swagger
open lib/version.rb           # bump the version number
rake spec                     # test
git commit -am "newness"      # commit
git push origin master        # push
rake release                  # release
```

Props
-----

* Thanks to [Jason Adams](http://twitter.com/#!/ealdent) for graciously turning 
	over the [wordnik gem name](https://rubygems.org/gems/wordnik).
* HTTP requests are made using [Typhoeus](https://github.com/dbalatero/typhoeus), 
	a modern code version of the mythical beast with 100 serpent heads.