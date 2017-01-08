require 'delegate'

module AdminScript
  class Configuration
    def self.define_configuration(name, default: nil)
      define_method name do
        @configurations[name]
      end

      define_method :"#{name}=" do |value|
        @configurations[name] = value
      end

      default_configurations[name] = default
    end

    def self.default_configurations
      @default_configurations ||= {}
    end

    def initialize
      @configurations = self.class.default_configurations.clone
    end

    define_configuration(:parent_controller, default: 'ActionController::Base')
    define_configuration(:controller, default: 'AdminScript::AdminScriptsController')
    define_configuration(:default_url_options, default: {})
  end
end
