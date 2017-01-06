require_relative 'boot'

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require 'admin_script'

module Dummy
  class Application < Rails::Application
    config.i18n.available_locales = [:ja]
    config.i18n.default_locale = :ja
  end
end

