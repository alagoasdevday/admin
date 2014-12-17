Rails.application.routes.draw do
  root to: redirect('http://www.alagoasdevday.com.br')

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount API => '/'
end
