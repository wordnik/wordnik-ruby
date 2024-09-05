# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wordnik/version"

Gem::Specification.new do |s|
  s.name        = "wordnik"
  s.version     = Wordnik::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Zeke Sikelianos", "John McGrath", "Will Fitzgerald"]
  s.email       = ["zeke@wordnik.com", "john@wordnik.com", "willf@noreply.github.com"]
  s.homepage    = "https://developer.wordnik.com"
  s.summary     = %q{A ruby wrapper for the Wordnik API}
  s.description = %q{This gem provides a simple interface to the entire Wordnik API. Its methods are defined by the documentation that comes from the API itself, so it's guaranteed to be up to date.}

  s.rubyforge_project = "wordnik"

  s.add_dependency 'typhoeus'
  s.add_dependency 'htmlentities'
  s.add_dependency 'addressable'
  s.add_dependency 'nokogiri'
  s.add_dependency 'activemodel'
  s.add_dependency 'json'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'autotest'
  s.add_development_dependency 'autotest-rails-pure'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'ruby-prof'

  s.files         = [
    `git ls-files`,
    `find api_docs -name '*.json'`,
    `find lib/wordnik/resource_modules -name '*.rb'`,
  ].flatten.join("\n").split("\n").uniq.select{|f| !f.empty? }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
