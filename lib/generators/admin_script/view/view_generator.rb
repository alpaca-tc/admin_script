require 'rails/generators'

module AdminScript
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      desc 'AdminScript view generator'

      def install
        copy_file "view.html.#{template_engine}", "app/views/admin_script/admin_scripts/_#{file_path.tr('/', '_')}.#{template_engine}"
      end

      private

      def template_engine
        name = Rails.configuration.generators.rails[:template_engine]

        if name.to_s.in?(['erb', 'slim'])
          name
        else
          :erb
        end
      end
    end
  end
end
