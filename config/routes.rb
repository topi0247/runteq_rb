Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "static_pages#index"
  get "auth/:provider/callback", to: "sessions#omniauth_callback"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  namespace :proposal do
    root to: "posts#index"
    resources :posts, only: %i[show new create]
    resource :users, only: %i[new show edit update]
  end
end
