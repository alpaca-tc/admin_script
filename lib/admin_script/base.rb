require 'active_support/core_ext/class/subclasses'
require 'active_model'

module AdminScript
  class Base
    include AdminScript::TypeAttributes
    include ActiveModel::Model
    include ActiveModel::Validations::Callbacks
    extend ActiveModel::Callbacks

    define_model_callbacks :initialize, only: :after

    attr_accessor :location_url

    class << self
      def inherited(subclass)
        super

        subclass.class_exec do
          cattr_accessor :description
        end
      end

      def type_attributes
        @type_attributes ||= {}
      end

      def type_attributes=(attrs_with_types)
        attr_accessor(*attrs_with_types.keys)

        attrs_with_types.each do |name, type|
          type_attribute(name, type)
        end

        type_attributes.merge!(attrs_with_types)
      end

      def id
        model_name.element
      end

      def find_class(id)
        subclasses.find { |klass| klass.id == id }
      end

      def script
        instance_method(:perform!).source
      end
    end

    def initialize(*)
      run_callbacks :initialize do
        super
      end
    end

    def id
      self.class.id
    end
    alias to_param id

    def perform!
      raise NotImplementedError, 'not implemented'
    end

    private

    def url_helpers
      Rails.application.routes.url_helpers
    end
  end
end
