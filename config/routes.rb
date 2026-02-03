# config/routes.rb
Rails.application.routes.draw do
  get "freelancer_profiles/new"
  get "freelancer_profiles/create"
  get "freelancer_profiles/show"
  get "freelancer_profiles/edit"
  get "freelancer_profiles/update"
  get "client_profiles/new"
  get "client_profiles/create"
  get "client_profiles/show"
  get "client_profiles/edit"
  get "client_profiles/update"


  # Devise routes with custom controllers
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register"
  }, controllers: {
    registrations: "users/registrations"
  }

  # Static pages
  get "pages/client"
  get "pages/freelancer"
  get "/select-role", to: "pages#select_role"


  # Profile routes
  resources :client_profiles, only: [ :new, :create, :show, :edit, :update ]
  resources :freelancer_profiles, only: [ :new, :create, :show, :edit, :update ]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root to: "pages#landing"
end
