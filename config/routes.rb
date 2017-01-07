AdminScript::Engine.routes.draw do
  resources :admin_scripts, only: [:index, :edit, :update],
    path: '',
    controller: AdminScript.configuration.controller_path
end
