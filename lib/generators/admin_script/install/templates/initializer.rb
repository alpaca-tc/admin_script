AdminScript.configure do |config|
  # Configure the parent class responsible to render views.
  # config.parent_controller = 'ActionController::Base'

  # Configure the path to admin script classes.
  # config.admin_script_paths = [Rails.root.join('app', 'models', 'admin_script').to_s]

  # Custom controller. Default controller is AdminScript::AdminScriptsController
  # config.controller_path = 'admin_scripts'
  #
  #   Example:
  #     class Admin::ScriptsController < AdminScript::AdminScriptsController; end
  #     config.controller_path = '/admin/scripts'
end
