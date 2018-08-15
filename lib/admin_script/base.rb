require 'active_support/core_ext/class/subclasses'
require 'active_model'
require 'method_source'

module AdminScript
  class Base
    include ActiveModel::Model
    include ActiveModel::Validations::Callbacks

    if ActiveModel.gem_version < Gem::Version.create('5.2.0')
      include ActiveModelAttributes
    else
      include ActiveModel::Attributes
    end

    extend ActiveModel::Callbacks

    define_model_callbacks :initialize, only: :after

    attr_accessor :location_url, :failure_message, :success_message

    class << self
      RESERVED_CLASSE_NAMES = %w(
        AdminScript::Base
        AdminScript::Configuration
        AdminScript::Engine
        AdminScript::VERSION
      ).freeze

      def inherited(subclass)
        if RESERVED_CLASSE_NAMES.include?(subclass.to_s)
          raise ArgumentError, "Reserved class name given. #{subclass}"
        end

        super

        subclass.class_exec do
          cattr_accessor :description
        end
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

    def persisted?
      true
    end

    def to_param
      self.class.to_param
    end

    def perform
      raise NotImplementedError, 'not implemented yet.'
    end

    private

    def url_helpers
      Rails.application.routes.url_helpers
    end
  end
end
