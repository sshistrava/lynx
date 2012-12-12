# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lynx/version'

Gem::Specification.new do |gem|
  gem.name          = "lynx"
  gem.version       = Lynx::VERSION
  gem.authors       = ["Pan Thomakos"]
  gem.email         = ["pan.thomakos@gmail.com"]
  gem.description   = %q{Ruby command line wrapper for MySQL.}
  gem.summary       = %q{Ruby command line wrapper for MySQL.}
  gem.homepage      = "https://www.github.com/panthomakos/lynx"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('minitest')
end
