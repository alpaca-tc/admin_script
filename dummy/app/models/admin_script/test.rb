module AdminScript
  class Test < Base
    def save
      Rails.logger.debug('success')
      true
    end
  end
end
