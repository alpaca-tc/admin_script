require 'rails/generators'

module AdminScript
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      desc 'AdminScript model generator'

      def install
        # FIXME: Improve default template
        template 'model.rb', "app/models/admin_script/#{file_path.tr('/', '_')}.rb"
      end
    end
  end
end
