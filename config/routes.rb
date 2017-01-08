AdminScript::Engine.routes.draw do
  controller = AdminScript.configuration.controller.constantize

  resources :admin_scripts, only: [:index, :edit, :update],
    path: '',
    controller: "/#{controller.controller_path}" # REVIEW: Is absolute controller path available?
end
