class MoviesController < ApplicationController

  helper_method :current_movie

  def index
    if params[:title]
      @movies = Movie.find_by_title(params[:title])
    else
      @movies = Movie.alpha
    end
  end

  def new
    redirect_if_not_admin
    @movie = Movie.new
    3.times { @movie.genres.build }
    8.times { @movie.actors.build }
  end

  def create
    redirect_if_not_admin
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def show
    # flash message if actor or genre is deleted?
  end

  def edit
    redirect_if_not_admin
    # using current_movie is impacting blank genre and actor fields
    @movie = current_movie
  end

  def update
    if current_movie.update(movie_params)
      redirect_to movie_path(current_movie)
      flash[:message] = "Movie sucessfully updated."
    else
      render :edit
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :synopsis, :year, :genres_attributes => [:name], :actors_attributes => [:first_name, :last_name])
    end

    def current_movie
      current_movie ||= Movie.find_by_id(params[:id])
    end

end
