module AdminScript
  class Engine < ::Rails::Engine
    isolate_namespace AdminScript

    initializer 'admin_script.load_subclasses', before: :set_clear_dependencies_hook do |app|
      path = app.paths['app/models'].first

      reload_scrpits = -> {
        Dir["#{path}/admin_script/**/*.rb"].each do |full_path|
          require_dependency(full_path)
        end
      }

      reloader = AdminScript::Reloader.file_watcher.new([], { "#{path}/admin_script" => [:rb] }) do
        ActiveSupport::DescendantsTracker.clear
        ActiveSupport::Dependencies.clear

        reload_scrpits.call
      end

      config.to_prepare do
        reloader.execute_if_updated
      end

      # Execute reloader at the first
      reload_scrpits.call

      app.reloaders << reloader
    end

    config.after_initialize do
      AdminScript::Engine.routes.default_url_options =
        AdminScript.configuration.default_url_options.presence || Rails.application.routes.default_url_options
    end
  end
end
