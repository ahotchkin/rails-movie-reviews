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

  # find_by_slug actor url
  # get "/actors/:slug" => "actors#show"

  resources :reviews
  # resources :movie_actors, only: [:destroy]
  # resources :movie_genres, only: [:destroy]
  resources :genres, only: [:show]
  resources :actors, only: [:index, :show]
  resources :users
  resources :movies
  resources :movies, only: [:show] do
    resources :reviews, only: [:index, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
