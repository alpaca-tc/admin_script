require 'slim-rails'
require 'bootstrap-sass'
require 'jquery-rails'

module AdminScript
  class Engine < ::Rails::Engine
    isolate_namespace AdminScript

    AdminScript::Bootstrap.new.load!

    initializer 'admin_script.i18n' do |app|
      app.config.i18n.load_path += gem_locale_files(app)
    end

    initializer 'admin_script.load_subclasses', before: :set_clear_dependencies_hook do |app|
      path = app.paths['app/models'].first

      reloader = AdminScript::Reloader.file_watcher.new([], { "#{path}/admin_script" => [:rb] }) do
        Dir["#{path}/admin_script/**/*.rb"].each do |full_path|
          load(full_path)
        end
      end

      config.to_prepare do
        reloader.execute_if_updated
      end

      app.reloaders << reloader
    end

    config.assets.paths += %w(stylesheets javascripts fonts).map do |path|
      File.expand_path("../../../vendor/#{path}", __FILE__)
    end

    config.after_initialize do
      AdminScript::Engine.routes.default_url_options =
        AdminScript.configuration.default_url_options.presence || Rails.application.routes.default_url_options
    end

    private

    def gem_locale_files(app)
      array = Array.wrap(app.config.i18n.available_locales)
      available_locales = array.blank? ? '*' : "{#{array.join ','}}"

      locale_pattern = File.expand_path("../../../config/locales/admin_script/#{available_locales}.yml", __FILE__)
      Dir[locale_pattern]
    end
  end
end
