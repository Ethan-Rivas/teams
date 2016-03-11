Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'frontend#show'

  namespace :api do
    namespace :v1 do
      resources :players
    end
  end

end
