Rails.application.routes.draw do
  post 'guest_login', to: 'user_sessions#guest_login'
  get '/login', to:'user_sessions#new'
  post '/login', to:'user_sessions#create'
  delete '/logout', to:'user_sessions#destroy'
  root 'home#top'
  get 'pages/Terms_of_use'
  get 'pages/policy'
  resources :users, only: %i[new create] do
    resource :profile, only: %i[show edit update destroy] do 
      get :follows, :followers
    end
    resource :relationships, only: %i[create destroy]
  end
  resources :posts do
    get :auto_search, on: :collection
    resources :comments, only: %i[create destroy], shallow: true
    resource :likes, only: %i[create destroy]
  end
end
