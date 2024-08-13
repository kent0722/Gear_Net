Rails.application.routes.draw do
  get '/login', to:'user_sessions#new'
  post '/login', to:'user_sessions#create'
  delete '/logout', to:'user_sessions#destroy'
  root 'home#top'
  resources :users, only: [:new, :create]
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
  end
end
