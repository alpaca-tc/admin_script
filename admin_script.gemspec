lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'admin_script/version'

Gem::Specification.new do |spec|
  spec.name          = 'admin_script'
  spec.version       = AdminScript::VERSION
  spec.authors       = ['alpaca-tc']
  spec.email         = ['alpaca-tc@alpaca.tc']
  spec.licenses    = ['MIT']

  spec.summary       = %q{A module for creating flexible, simple scripts for project in Rails.}
  spec.homepage      = 'https://github.com/alpaca-tc/admin_script'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 5.2.0.beta2', '< 6.0.0'
  spec.add_dependency 'method_source', '>= 0.8.0', '< 0.10.0'
  spec.add_dependency 'bootstrap-sass', '>= 3.0.0', '< 5.0.0'
  spec.add_dependency 'sass-rails', '>= 3.2', '< 7.0.0'
  spec.add_dependency 'jquery-rails', '>= 1.0.0', '< 6.0.0'
  spec.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3'
  spec.add_development_dependency 'bundler', '~> 1.13', '>= 1.13'
  spec.add_development_dependency 'rake', '~> 10.0', '>= 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
end
