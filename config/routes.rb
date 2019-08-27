Rails.application.routes.draw do
  resources :movie_genres
  root "sessions#home"

  get "/signup" => "users#new"
  # if a user signs up incorrectly the url re-renders as /signup
  post "/signup" => "users#create"

  # login
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  # logout
  delete "/logout" => "sessions#destroy"

  resources :reviews
  # resources :movie_actors
  # resources :genres
  # resources :actors
  resources :users
  resources :movies
  resources :movies, only: [:show] do
    resources :reviews, only: [:index, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
