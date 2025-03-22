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
    root to: "users#index"
    patch "role_change" => "users#role_change"
    resources :posts, only: %i[index]
    patch "role_change" => "users#role_change"
  end
end
