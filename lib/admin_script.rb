require 'admin_script/version'

module AdminScript
  autoload :Base, 'admin_script/base'
  autoload :Bootstrap, 'admin_script/bootstrap'
  autoload :Controller, 'admin_script/controller'
  autoload :Configuration, 'admin_script/configuration'
  autoload :Reloader, 'admin_script/reloader'

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end

require 'admin_script/engine' if defined?(Rails)
