# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'direct_inject/version'

Gem::Specification.new do | spec |
  spec.name        = 'direct_inject'
  spec.version     = DirectInject::VERSION
  spec.authors     = [ 'Ryan Cook' ]
  spec.email       = [ 'cookrn@gmail.com' ]
  spec.homepage    = 'https://github.com/cookrn/direct_inject'
  spec.summary     = %q{Sprockets/Rails helpers for directly injecting assets onto the page.}
  spec.description = %q{Sprockets/Rails helpers for directly injecting assets onto the page as an alternative to linking/sourcing an asset by URL.}
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'map'
  spec.add_dependency 'tagz'

  spec.add_development_dependency 'bundler' , '~> 1.7'
  spec.add_development_dependency 'rails'   , '>= 3.1'
  spec.add_development_dependency 'rake'    , '~> 10.0'
end
