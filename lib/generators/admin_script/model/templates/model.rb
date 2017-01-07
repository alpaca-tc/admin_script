class AdminScript
  class <%= class_name %> < AdminScript::Base
    self.description = '<%= class_name %>'

    type_attribute :id, :integer

    validates :id, presence: true

    def perform
      return false unless valid?

      # Do something

      true
    end

    # # Redirect to location_url if successfully performed.
    # def location_url; end
    #
    # # Display success_message if successfully performed.
    # def success_message; end
    #
    # # Display failure_message if failued to performing.
    # def failure_message; end
  end
end
