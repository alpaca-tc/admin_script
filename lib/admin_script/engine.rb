module AdminScript
  class Engine < ::Rails::Engine
    isolate_namespace AdminScript

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
