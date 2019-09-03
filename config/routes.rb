Rails.application.routes.draw do
  root "sessions#home"

  get "/signup" => "users#new"
  # if a user signs up incorrectly the url re-renders as /signup
  post "/signup" => "users#create"

  # login
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  # logout
  delete "/logout" => "sessions#destroy"

  # omniauth callback routes
  get "/auth/:providers/callback" => "sessions#omnilogin"

  # *** add scope for admin?

  resources :reviews
  resources :movie_actors, only: [:destroy]
  resources :movie_genres, only: [:destroy]
  resources :genres, only: [:index, :show]
  resources :actors, only: [:index, :show]
  resources :users
  # can i combine this line with the movies nested route??
  resources :users, only: [:show] do
    resources :reviews, shallow: true
  end
  resources :movies
  resources :movies, only: [:show] do
    resources :reviews, shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
