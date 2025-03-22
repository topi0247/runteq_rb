Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "sessions#new"
  get "auth/:provider/callback", to: "sessions#omniauth_callback"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  namespace :proposal do
    root to: "users#show"
    resources :posts, only: %i[show new create]
    resource :users, only: %i[edit update]
  end

  namespace :invitations do
    root to: "users#show"
    resources :posts, only: %i[show new create]
    resource :users, only: %i[edit update]
  end

  namespace :admin do
    resources :posts, only: %i[index show]
    root to: "users#index"
    resource :users, only: %i[show edit update]
  end
end
