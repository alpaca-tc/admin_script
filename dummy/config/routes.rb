Rails.application.routes.draw do
  mount AdminScript::Engine => '/engine'
end
