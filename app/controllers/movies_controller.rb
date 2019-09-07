class MoviesController < ApplicationController

  helper_method :current_movie
  before_action :redirect_if_not_admin, only: [:new, :create, :edit, :update]

  def index
    if params[:title]
      @movies = Movie.find_by_title(params[:title])
    else
      @movies = Movie.alpha
    end
  end

  def new
    @movie = Movie.new
    3.times { @movie.genres.build }
    8.times { @movie.actors.build }
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def show
    # current_movie is nil in view
    @movie = Movie.find_by_id(params[:id])
  end

  def edit
    # using current_movie is impacting blank genre and actor fields
    @movie = Movie.find_by_id(params[:id])
    genre_number = 3 - @movie.genres.size
    genre_number.times { @movie.genres.build }

    actor_number = 8 - @movie.actors.size
    actor_number.times { @movie.actors.build }
  end

  def update
    # using current_movie is causing @movie to be nil
    @movie = Movie.find_by_id(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
      flash[:message] = "Movie sucessfully updated."
    else
      render :edit
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :synopsis, :year, :genres_attributes => [:name], :actors_attributes => [:first_name, :last_name])
    end

    # def current_movie
    #   movie = Movie.find_by_id(params[:id])
    #   redirect_to movies_path if !movie
    # end

end
