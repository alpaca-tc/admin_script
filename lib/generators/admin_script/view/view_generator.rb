require 'rails/generators'

module AdminScript
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      desc 'AdminScript view generator'

      def install

        template 'view.html.slim', "app/views/admin_script/admin_scripts/_#{file_path.tr('/', '_')}.rb"
        template 'view.html.erb', "app/views/admin_script/admin_scripts/_#{file_path.tr('/', '_')}.rb"
      end

      private

      def template_engine
        name = Rails.configuration.rails[:template_engine]

        if template_engine.to_s.in?(['erb', 'slim'])
          name
        else
          :erb
        end
      end
    end
  end
end
