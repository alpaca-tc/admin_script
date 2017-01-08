module AdminScript
  module Reloader
    def self.file_watcher
      case Rails.version[0]
      when '4'
        ActiveSupport::FileUpdateChecker
      when '5'
        Rails.application.config.file_watcher || ActiveSupport::FileUpdateChecker
      else
        raise 'Unsupported rails version!'
      end
    end
  end
end
