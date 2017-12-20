module AdminScript
  class ExpireUserSession < AdminScript::Base
    self.description = 'Expire user session'

    # Define type attribute to cast user input.
    # the following defines `#id` and `#id=` as typecast method.
    attribute :id, :integer

    attr_reader :user

    validates :id, :user, presence: true
    before_validation :set_user

    def perform
      return false unless valid?
      user.expire_session!

      true
    end

    private

    def set_user
      @user = User.find_by(id: id) if id
    end
  end
end
