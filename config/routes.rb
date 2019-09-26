Rails.application.routes.draw do
  root "sessions#home"

  # signup
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

  resources :reviews, :movies
  resources :movie_actors, :movie_genres, only: [:destroy]
  resources :actors, :genres, only: [:index]
  resources :users, only: [:show]
  resources :movies, :users, only: [:show] do
    resources :reviews, shallow: true
  end
  resources :actors, :genres, only: [:show] do
    resources :movies, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
