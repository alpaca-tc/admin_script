Rails.application.routes.draw do
  mount AdminScript::Engine => '/admin_scripts'
end
