require 'active_support/concern'

module AdminScript
  # Define method to cast value
  module TypeAttributes
    extend ActiveSupport::Concern

    module ClassMethods
      def type_attribute(name, cast_type)
        define_method name do
          value = instance_variable_get(:"@#{name}")
          ActiveModel::Type.lookup(cast_type).cast(value)
        end

        define_method "#{name}=" do |decibels|
          value = ActiveModel::Type.lookup(cast_type).cast(decibels)
          instance_variable_set(:"@#{name}", value)
        end
      end
    end
  end
end
