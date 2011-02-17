wordnik ruby gem
================

This gem fully wraps Wordnik's v4 API.

### Installation (Manual)

	gem install wordnik
	
Put this somewhere in your app's initialization process:

	Wordnik.configure do |config|
		config.api_key = '12345abcde'
  	config.response_format = :json # defaults to json, but xml is also supported
	end

### Rails 3.x

Add the wordnik gem to your Gemfile.rb:

    gem 'wordnik'

Then from your project's RAILS_ROOT, run:

    bundle install

Create config/initializers/wordnik.rb and drop this in:

	Wordnik.configure do |config|
		config.api_key = '12345abcde'
		config.response_format = :json # defaults to json, but xml is also supported
	end

### Rails 2.x

Add the wordnik gem to your app. In config/environment.rb:

    config.gem 'hoptoad_notifier'

Then from your project's RAILS_ROOT, run:

    rake gems:install
    rake gems:unpack GEM=wordnik

Create config/initializers/wordnik.rb and drop this in:

	Wordnik.configure do |config|
		config.api_key = '12345abcde'
		config.response_format = :json # defaults to json, but xml is also supported
	end