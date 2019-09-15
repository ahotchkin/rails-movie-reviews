class MoviesController < ApplicationController

  # helper_method :current_movie
  helper_method :sort_column
  before_action :redirect_if_not_admin, only: [:new, :create, :edit, :update]

  def index
    if params[:title]
      @movies = Movie.find_by_title(params[:title])
    else
      @movies = Movie.order(sort_column + " " + sort_direction)
    end
  end

  def new
    @movie = Movie.new
    @movie.actor_number
    @movie.genre_number
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      @movie.actor_number
      @movie.genre_number
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
    @movie.actor_number
    @movie.genre_number
  end

  def update
    # using current_movie is causing @movie to be nil
    @movie = Movie.find_by_id(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
      flash[:message] = "Movie successfully updated."
    else
      @movie.actor_number
      @movie.genre_number
      render :edit
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :synopsis, :year, :genres_attributes => [:name], :actors_attributes => [:first_name, :last_name])
    end

    # def current_movie
    #   current_movie ||= Movie.find_by_id(params[:id])
    #   redirect_to movies_path if !current_movie
    # end

    def sort_column
      Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

end
