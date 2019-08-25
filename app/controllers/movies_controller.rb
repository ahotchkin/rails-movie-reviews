class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sort { |a, b| a.title <=> b.title }
  end

  def new
    redirect_if_not_admin
    @movie = Movie.new
  end

  def create
    redirect_if_not_admin
    # movie = current_user.movies.build(review_params)
    # raise params.inspect
    movie = Movie.new(movie_params)
    if movie.save
      redirect_to movie_path(movie)
    else
      render :new
    end
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :synopsis, :year)
    end


end
