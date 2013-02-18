# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_token/version'

Gem::Specification.new do |gem|
  gem.name          = "simple_token"
  gem.version       = SimpleToken::VERSION
  gem.authors       = ["Enrique Vidal"]
  gem.email         = ["enrique@cloverinteractive.com"]
  gem.description   = %q{Easily create unique tokens in active record models}
  gem.summary       = %q{Simple token creation gem}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'activerecord'
  gem.add_development_dependency 'activesupport'
end
