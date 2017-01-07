require 'rails/generators'

module AdminScript
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'AdminScript installation generator'

      def install
        route("mount AdminScript::Engine => '/admin_script'")
        template 'initializer.rb', 'config/initializers/admin_script.rb'
      end
    end
  end
end
