require 'admin_script/version'
require 'admin_script/engine' if defined?(Rails)
require 'slim-rails'

module AdminScript
  autoload :Base, 'admin_script/base'
  autoload :TypeAttributes, 'admin_script/type_attributes'
  autoload :Controller, 'admin_script/controller'
  autoload :Configuration, 'admin_script/configuration'

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
