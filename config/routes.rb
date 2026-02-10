# config/routes.rb
Rails.application.routes.draw do
  get "users/destroy_account"
  get "notifications/index"
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
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  # Static pages
  get "pages/client", to: "pages#client", as: "user_client"
  get "pages/freelancer", to: "pages#freelancer", as: "user_freelancer"
  get "/select-role", to: "pages#select_role", as: "select_role"
  get "welcome", to: "pages#welcome", as: "welcome_page"
  get "/profile", to: "profiles#show", as: :profile
  get "/notification", to: "notifications#index", as: "notification"
  get "/profile/index"


  # Profile routes
  resources :client_profiles, only: [ :new, :create, :show, :edit, :update ]
  resources :freelancer_profiles, only: [ :new, :create, :show, :edit, :update ]
  resource :profile, controller: "client_profiles", only: [ :new, :create, :show, :edit, :update ]

  # Custom route to delete user account
  resource :users, only: [] do
    delete "destroy_account", to: "users#destroy_account"
  end


  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root to: "pages#landing"
end
