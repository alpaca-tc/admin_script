require 'slim-rails'
require 'bootstrap-sass'
require 'jquery-rails'

module AdminScript
  class Engine < ::Rails::Engine
    isolate_namespace AdminScript

    AdminScript::Bootstrap.new.load!

    initializer 'admin_script.i18n' do |app|
      array = Array.wrap(app.config.i18n.available_locales)
      available_locales = array.blank? ? '*' : "{#{array.join ','}}"

      locale_pattern = File.expand_path("../../../config/locales/admin_script/#{available_locales}.yml", __FILE__)
      locale_files = Dir[locale_pattern]

      app.config.i18n.load_path += locale_files
    end

    config.assets.paths += %w(stylesheets javascripts fonts).map do |path|
      File.expand_path("../../../vendor/#{path}", __FILE__)
    end

    config.after_initialize do
      AdminScript::Engine.routes.default_url_options = AdminScript.configuration.default_url_options.presence ||
        Rails.application.routes.default_url_options
    end

    config.to_prepare do
      AdminScript.configuration.admin_script_paths.each do |path|
        finder = Pathname.new(path).join('**', '*.rb')

        Dir[finder].each do |path|
          require_dependency(path)
        end
      end
    end
  end
end
