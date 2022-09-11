Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments
    member do
      get '/like', to: 'posts#like', as: :like
      get '/unlike', to: 'posts#unlike', as: :unlike
    end
  end
  devise_for :users
  resources :friendships 
  get '/users', to: 'users#index', as: :users
  get '/:id', to: 'users#show', as: :user
end