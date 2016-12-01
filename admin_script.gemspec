lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'admin_script/version'

Gem::Specification.new do |spec|
  spec.name          = 'admin_script'
  spec.version       = AdminScript::VERSION
  spec.authors       = ['alpaca-tc']
  spec.email         = ['alpaca-tc@alpaca.tc']

  spec.summary       = %q{}
  spec.description   = %q{}
  spec.homepage      = 'https://github.com/alpaca-tc/admin_script'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'activemodel', '>= 4.0.0', '< 6.0.0'
  spec.add_development_dependency 'bundler', "~> 1.13"
  spec.add_development_dependency 'rake', "~> 10.0"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
end
