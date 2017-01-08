require 'rails/generators'

module AdminScript
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      desc 'AdminScript view generator'

      def install
        template 'view.html.slim', "app/views/admin_script/admin_scripts/_#{file_path.tr('/', '_')}.rb"
      end
    end
  end
end
