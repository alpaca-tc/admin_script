Rails.application.routes.draw do
  root to: redirect('/engine')
  mount AdminScript::Engine => '/engine'
end
