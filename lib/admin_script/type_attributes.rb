require 'active_support/concern'
require 'active_model'

module AdminScript
  # Define method to cast value
  module TypeAttributes
    extend ActiveSupport::Concern

    module ClassMethods
      def define_type_attribute_accessor(name, cast_type)
        define_method name do
          value = instance_variable_get(:"@#{name}")
          AdminScript::TypeAttributes.cast_value(cast_type, value)
        end

        define_method "#{name}=" do |decibels|
          value = AdminScript::TypeAttributes.cast_value(cast_type, decibels)
          instance_variable_set(:"@#{name}", value)
        end
      end
    end

    if defined?(ActiveModel) && ActiveModel.gem_version >= Gem::Version.new('5.0.0')
      # Rails 5
      require 'active_model/type'

      def self.cast_value(cast_type, value)
        ActiveModel::Type.lookup(cast_type).cast(value)
      end
    else
      # Rails 4.2
      require 'active_record'

      def self.cast_value(cast_type, value)
        ActiveRecord::Type.const_get(cast_type.to_s.classify).new.type_cast_from_user(value)
      end
    end
  end
end
