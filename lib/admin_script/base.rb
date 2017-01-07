require 'active_support/core_ext/class/subclasses'
require 'active_model'
require 'method_source'

module AdminScript
  class Base
    include AdminScript::TypeAttributes
    include ActiveModel::Model
    include ActiveModel::Validations::Callbacks
    extend ActiveModel::Callbacks

    define_model_callbacks :initialize, only: :after

    attr_accessor :location_url

    class << self
      RESERVED_CLASSE_NAMES = %w(
        AdminScript::Base
        AdminScript::Configuration
        AdminScript::Engine
        AdminScript::TypeAttributes
        AdminScript::VERSION
      ).freeze

      def inherited(subclass)
        if RESERVED_CLASSE_NAMES.include?(subclass.to_s)
          raise ArgumentError, "Reserved class name given. #{subclass}"
        end

        super

        subclass.class_exec do
          cattr_accessor :description
          cattr_accessor :type_attributes
          self.type_attributes = {}
        end
      end

      def type_attribute(name, type)
        name = name.to_sym
        type = type.to_sym

        define_type_attribute_accessor(name, type)
        type_attributes.merge!(name => type)
      end

      def to_param
        model_name.element
      end

      def find_class(element)
        subclasses.find { |klass| klass.to_param == element }
      end

      def script
        instance_method(:perform).source
      end
    end

    def initialize(*)
      run_callbacks :initialize do
        super
      end
    end

    def to_param
      self.class.to_param
    end

    def perform
      raise NotImplementedError, 'not implemented yet.'
    end

    def failure_message; end

    def success_message; end

    private

    def url_helpers
      Rails.application.routes.url_helpers
    end
  end
end
