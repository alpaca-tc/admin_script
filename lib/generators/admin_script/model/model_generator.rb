require 'rails/generators'

module AdminScript
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      argument :attributes, type: :array, default: [], banner: 'field[:type] field[:type]'
      desc 'AdminScript model generator'

      def install
        template 'model.rb', "app/models/admin_script/#{file_path.tr('/', '_')}.rb"
      end
    end
  end
end
