# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wordnik/version"

Gem::Specification.new do |s|
  s.name        = "wordnik"
  s.version     = Wordnik::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Zeke Sikelianos", "John McGrath"]
  s.email       = ["zeke@wordnik.com", "john@wordnik.com"]
  s.homepage    = "http://developer.wordnik.com"
  s.summary     = %q{A ruby wrapper for the Wordnik API}
  s.description = %q{This gem provides a simple interface to the entire Wordnik API. Its methods are defined by the documentation that comes from the API itself, so it's guaranteed to be up to date.}

  s.rubyforge_project = "wordnik"

  s.add_dependency 'typhoeus', '0.2.1'
  s.add_dependency 'htmlentities', '4.2.4'
  s.add_dependency 'addressable', '2.2.4'
  s.add_dependency 'nokogiri', '1.4.4'
  s.add_dependency 'activemodel', '3.0.3'
  s.add_dependency 'json', '1.4.6'

  s.add_development_dependency 'rspec', '2.4.0'
  s.add_development_dependency 'vcr', '1.5.1'
  s.add_development_dependency 'webmock', '1.6.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
