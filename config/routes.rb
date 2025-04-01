Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "sessions#new"
  get "top", to: "static_pages#index"
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
    resource :mypages, only: %i[show edit update]
    patch "role_change" => "users#role_change"
    patch "selection" => "posts#selection"
    resources :candidates, only: %i[create destroy]
  end
end
