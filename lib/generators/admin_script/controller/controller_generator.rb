require 'rails/generators'

module AdminScript
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      desc 'AdminScript custom controller generator'

      def install
        template 'controller.rb', "app/controllers/#{file_path}_controller.rb"
        template 'layout.html.slim', 'app/views/layouts/admin_script/application.html.slim'
        template '../../install/templates/initializer.rb', 'config/initializers/admin_script.rb'

        inject_into_file 'config/initializers/admin_script.rb', after: "AdminScript.configure do |config|" do <<-RUBY

  config.controller = '#{class_name}Controller'
        RUBY
       end
      end
    end
  end
end
