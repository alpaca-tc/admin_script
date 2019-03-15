module AdminScript
  class Engine < ::Rails::Engine
    isolate_namespace AdminScript

    initializer 'admin_script.load_subclasses', before: :set_clear_dependencies_hook do |app|
      config.to_prepare do
        # Reload app/models/admin_script/**/*.rb
        path = app.paths['app/models'].first

        Dir["#{path}/admin_script/**/*.rb"].each do |full_path|
          require_dependency(full_path)
        end
      end
    end

    config.after_initialize do
      AdminScript::Engine.routes.default_url_options =
        AdminScript.configuration.default_url_options.presence || Rails.application.routes.default_url_options
    end
  end
end
