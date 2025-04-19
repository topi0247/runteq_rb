Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "timelines#index"
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
    root to: "users#index"
    resources :posts, only: %i[index show]
    resource :mypages, only: %i[show edit update]
    patch "role_change" => "users#role_change"
    patch "selection" => "posts#selection"
    patch "presentation_position" => "posts#presentation_position"
    resources :candidates, only: %i[create destroy]
  end
end
