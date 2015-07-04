# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'client_smsapi/version'

Gem::Specification.new do |spec|
  spec.name          = 'client_smsapi'
  spec.version       = SMSApi::VERSION
  spec.authors       = ['Artur Debski']
  spec.email         = ['xmentero@gmail.com']

  spec.summary       = 'smsapi.pl ruby client'
  spec.description   = 'smsapi.pl ruby client'
  spec.homepage      = 'https://github.com/mentero/client_smsapi'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.13'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
end
