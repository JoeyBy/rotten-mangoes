RottenMangoes::Application.routes.draw do
  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'movies#index'

  namespace :admin do
    resources :users
  end
  
end
