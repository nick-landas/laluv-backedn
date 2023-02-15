Rails.application.routes.draw do
  # resources :fans
  # resources :messages
  # resources :enrollments
  # resources :parlors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/me', to: 'fans#show'
    post '/signup', to: 'fans#create'
    get '/profile', to: 'fans#profile'

    resources :parlors, only: [:index, :show] do
    resources :messages, only: [:create, :update]
    resources :enrollments, only: [:create, :destroy]
    end
    
    resources :fans, only: [:update]
    resources :messages, only: [:show, :destroy]
  end

  mount ActionCable.server => '/cable'
  
  get '*path',
    to: 'fallback#index',
    constraints: ->(req) { !req.xhr? && req.format.html? }
end
