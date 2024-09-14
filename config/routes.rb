Rails.application.routes.draw do
  get 'notifications/index'
  get 'notifications/destory'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  post 'guest_login', to: 'user_sessions#guest_login'
  get '/login', to:'user_sessions#new'
  post '/login', to:'user_sessions#create'
  delete '/logout', to:'user_sessions#destroy'
  root 'home#top'
  get 'pages/Terms_of_use'
  get 'pages/policy'
  resources :password_resets, only: %i[new create edit update]
  resources :users do
    member do
      get :follows, :followers
    end
    resource :profile, only: %i[show edit update destroy]
    resource :relationships, only: %i[create destroy]
    resources :notifications, only: %i[index]
  end
  resources :posts do
    get :auto_search, on: :collection
    resources :comments, only: %i[create destroy], shallow: true
    resource :likes, only: %i[create destroy]
  end
end
