Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  resources :users

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

end
