Rails.application.routes.draw do
  
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  get 'notes/index'
  get 'notes/new'
  get 'notes/show'
  # DEVISE
  devise_for :users, skip: :all
  devise_scope :user do
    get     "login",                to: "devise/sessions#new",          as: :new_user_session
    post    "login",                to: "devise/sessions#create",       as: :user_session
    delete  "logout",               to: "devise/sessions#destroy",      as: :destroy_user_session
    
    get     "/users/password/new",  to: "devise/passwords#new",         as: :new_user_password
    get     "/users/password/edit", to: "devise/passwords#edit",        as: :edit_user_password
    patch   "/users/password",      to: "devise/passwords#update",      as: :user_password
    put     "/users/password",      to: "devise/passwords#update"
    post    "/users/password",      to: "devise/passwords#create"

    get     "/users/cancel",        to: "devise/registrations#cancel",  as: :cancel_user_registration
    get     "register",             to: "devise/registrations#new",     as: :new_user_registration
    get     "/users/edit",          to: "devise/registrations#edit",    as: :edit_user_registration

    patch   "/users",               to: "devise/registrations#update",  as: :user_registration
    put     "/users",               to: "devise/registrations#update"
    delete  "/users",               to: "devise/registrations#destroy"
    post    "/users",               to: "devise/registrations#create"
  end

  # ROOT
  root to: "home#index"

  # Dashboard
  get "/dashboard", to: "dashboard#index"

  # Contacts
  resources :contacts

  # Groups
  resources :groups

  resources :contacts do
    # Notes
    resources :notes
    
    # Tasks
    resources :tasks
  end

end
