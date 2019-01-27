module AdminScript
  module Reloader
    def self.file_watcher
      Rails.application.config.file_watcher || ActiveSupport::FileUpdateChecker
    end
  end
end
