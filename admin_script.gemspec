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

  spec.add_dependency 'rails', '>= 5.2', '< 8.0.0'
  spec.add_dependency 'method_source', '>= 0.8.0'
end
