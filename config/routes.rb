Rails.application.routes.draw do

  get "/signup" => "users#new"

  # so if a user signs up incorrectly the url re-renders as /signup
  post "/signup" => "users#create"
  
  resources :reviews
  resources :movie_actors
  resources :genres
  resources :actors
  resources :users
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
