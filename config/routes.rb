Rails.application.routes.draw do

  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker


  resources :programmes

  
  resources :projects
# get "/projects", to: "projects#index", as: 'projects'
# get "/projects/new", to: "projects#new", as: 'new_project'
# post "/projects", to: "projects#create", as: 'create_projects'
# get "/projects/:id/edit", to: "projects#edit", as: 'edit_project'
# get "/projects/:id", to: "projects#show", as: 'show_project'
# patch "/projects/:id", to: "projects#update", as: 'patch_project'
# put "/projects/:id", to: "projects#update", as: 'update_project'
# delete "/projects/:id", to: "projects#destroy", as: 'project'

  resources :tasks

  resources :todos

  
  resources :comments

  resources :users

  # Defines the root path route ("/")
  root "programmes#index"
end
