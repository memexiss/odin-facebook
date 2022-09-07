Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
  resources :friend_requests, only: :create do
    member do
      post 'confirm'
      delete 'delete'
    end
  end
  get '/user/:id', to: 'users#profile', as: :user
  get "post/edit"
  get '/friends', to: 'users#friends', as: :friends
  scope '/friends', as: :friends do
    get 'find', to: 'users#find_friends'
    get 'requests', to: 'users#friend_requests'
  end
end
