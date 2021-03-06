# -*- encoding: utf-8 -*-
require './lib/vigilem/dom/version'

Gem::Specification.new do |s|
  s.name          = 'vigilem-dom'
  s.version       = Vigilem::DOM::VERSION
  s.platform      = Gem::Platform::RUBY # mingw, cygwin?
  s.summary       = 'DOM Structures for Vigilem'
  s.description   = 'DOM Structures for Vigilem'
  s.authors       = ['jtzero']
  s.email         = 'jtzero511@gmail'
  s.homepage      = 'http://rubygems.org/gems/vigilem-dom'
  s.license       = 'MIT'
  
  s.add_dependency 'vigilem-core'
  
  s.add_development_dependency 'yard'
  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'rspec-given'
  s.add_development_dependency 'turnip'
  s.add_development_dependency 'guard-rspec'
  
  s.files         = Dir['{lib,spec,ext,test,features,bin}/**/**'] + ['LICENSE.txt']
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
end
