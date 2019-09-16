require 'rails_helper'

RSpec.describe "Routing", :type => :routing do

  describe "Session Routes" do
    it { should route(:get, "/").to(:controller => :sessions, :action => :home) }
    it { should route(:get, "/login").to(:controller => :sessions, :action => :new) }
    it { should route(:post, "/login").to(:controller => :sessions, :action => :create) }
    it { should route(:delete, "/logout").to(:controller => :sessions, :action => :destroy) }
    it { should route(:get, "/auth/google_oauth2/callback").to(:controller => :sessions, :action => :omnilogin, :providers => :google_oauth2) }
  end

  describe "User Routes" do
    it { should route(:get, "/signup").to(:controller => :users, :action => :new) }
    it { should route(:post, "/signup").to(:controller => :users, :action => :create) }
    it { should route(:get, "/users/1").to(:controller => :users, :action => :show, :id => 1) }
  end

  describe "Actor Routes" do
    it { should route(:get, "/actors").to(:controller => :actors, :action => :index) }
    it { should route(:get, "/actors/1").to(:controller => :actors, :action => :show, :id => 1) }
  end

  describe "Genre Routes" do
    it { should route(:get, "/genres").to(:controller => :genres, :action => :index) }
    it { should route(:get, "/genres/1").to(:controller => :genres, :action => :show, :id => 1) }
  end

  describe "MovieActor Routes" do
    it { should route(:delete, "/movie_actors/1").to(:controller => :movie_actors, :action => :destroy, :id => 1) }
  end

  describe "MovieGenre Routes" do
    it { should route(:delete, "/movie_genres/1").to(:controller => :movie_genres, :action => :destroy, :id => 1) }
  end

  describe "Movie Routes" do
    it { should route(:get, "/movies").to(:controller => :movies, :action => :index) }
    it { should route(:post, "/movies").to(:controller => :movies, :action => :create) }
    it { should route(:get, "/movies/new").to(:controller => :movies, :action => :new) }
    it { should route(:get, "/movies/1/edit").to(:controller => :movies, :action => :edit, :id => 1) }
    it { should route(:get, "/movies/1").to(:controller => :movies, :action => :show, :id => 1) }
    it { should route(:patch, "/movies/1").to(:controller => :movies, :action => :update, :id => 1) }
    it { should route(:put, "/movies/1").to(:controller => :movies, :action => :update, :id => 1) }
    it { should route(:delete, "/movies/1").to(:controller => :movies, :action => :destroy, :id => 1) }
    describe "Nested Movie Routes under Actors" do
      it { should route(:get, "/actors/1/movies").to(:controller => :movies, :action => :index, :actor_id => 1) }
    end
    describe "Nested Movie Routes under Genres" do
      it { should route(:get, "/genres/1/movies").to(:controller => :movies, :action => :index, :genre_id => 1) }
    end
  end

  describe "Review Routes" do
    it { should route(:get, "/reviews").to(:controller => :reviews, :action => :index) }
    it { should route(:post, "/reviews").to(:controller => :reviews, :action => :create) }
    it { should route(:get, "/reviews/new").to(:controller => :reviews, :action => :new) }
    it { should route(:get, "/reviews/1/edit").to(:controller => :reviews, :action => :edit, :id => 1) }
    it { should route(:get, "/reviews/1").to(:controller => :reviews, :action => :show, :id => 1) }
    it { should route(:patch, "/reviews/1").to(:controller => :reviews, :action => :update, :id => 1) }
    it { should route(:put, "/reviews/1").to(:controller => :reviews, :action => :update, :id => 1) }
    it { should route(:delete, "/reviews/1").to(:controller => :reviews, :action => :destroy, :id => 1) }
    describe "Nested Review Routes Under Users" do
      it { should route(:get, "users/1/reviews").to(:controller => :reviews, :action => :index, :user_id => 1)}
      it { should route(:post, "users/1/reviews").to(:controller => :reviews, :action => :create, :user_id => 1)}
      it { should route(:get, "users/1/reviews/new").to(:controller => :reviews, :action => :new, :user_id => 1)}
    end
    describe "Nested Review Routes Under Movies" do
      it { should route(:get, "movies/1/reviews").to(:controller => :reviews, :action => :index, :movie_id => 1)}
      it { should route(:post, "movies/1/reviews").to(:controller => :reviews, :action => :create, :movie_id => 1)}
      it { should route(:get, "movies/1/reviews/new").to(:controller => :reviews, :action => :new, :movie_id => 1)}
    end
  end

end
