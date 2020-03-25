Rails.application.routes.draw do

  root "apps#home"
  resources :app_errors, only: [:update, :show]
  patch '/assign_developer/:id', to: 'app_errors#assign_developer', as: :assign_developer
  resources :developer_apps, only: [:create]
  # post '/add_developer/:id', to: "apps#add_developer", as: 'add_developer'
  namespace :api do
    resources :app_errors, only: :create
  end


  resources :apps, param: :name
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
