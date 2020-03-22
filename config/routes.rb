Rails.application.routes.draw do

  resources :app_errors
  namespace :api do
    resources :app_errors
  end

  root "apps#index"
  resources :apps, param: :name
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
