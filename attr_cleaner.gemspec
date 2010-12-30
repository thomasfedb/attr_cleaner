# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "attr_cleaner/version"

Gem::Specification.new do |s|
  s.name        = "attr_cleaner"
  s.version     = AttrCleaner::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Drake-Brockman"]
  s.email       = ["thomas@pixent.com.au"]
  s.homepage    = "https://rubygems.org/gems/attr_cleaner"
  s.summary     = "Cleans up model attributes."
  s.description = "Strips spaces from attributes, and sets empty strings to nil."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('activesupport', '~> 3.0.0')
  s.add_dependency('activerecord', '~> 3.0.0')
end
