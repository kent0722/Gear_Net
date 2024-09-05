Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'create/destroy'
  get 'follows/create'
  get 'follows/destroy'
  post 'guest_login', to: 'user_sessions#guest_login'
  get '/login', to:'user_sessions#new'
  post '/login', to:'user_sessions#create'
  delete '/logout', to:'user_sessions#destroy'
  root 'home#top'
  get 'pages/Terms_of_use'
  get 'pages/policy'
  resources :users, only: %i[new create] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :posts do
    get :auto_search, on: :collection
    resources :comments, only: %i[create destroy], shallow: true
    resource :likes, only: %i[create destroy]
  end
end
