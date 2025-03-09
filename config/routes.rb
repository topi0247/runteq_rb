Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "static_pages#index"
  get "auth/:provider/callback", to: "sessions#omniauth_callback"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  namespace :proposal do
    resources :posts, only: %i[show new create]
    resources :users, only: %i[show edit update]
  end
end
