Rails.application.routes.draw do
  devise_for :users
  root to: 'players#index'
  resources :players do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :show]
   
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
