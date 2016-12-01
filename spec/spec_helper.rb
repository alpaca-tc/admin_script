$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'admin_script'

RSpec.configure do |config|
  config.order = :random
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
