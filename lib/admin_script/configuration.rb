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

    define_configuration(:admin_script_paths, default: [
      (Rails.root.join('app', 'models', 'admin_script').to_s if defined?(Rails))
    ])
    define_configuration(:parent_controller, default: 'ActionController::Base')
    define_configuration(:default_url_options, default: {})
    define_configuration(:controller_path, default: 'admin_scripts')
  end
end
