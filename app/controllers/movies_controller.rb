class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sort { |a, b| a.title <=> b.title }
  end

  def new
    redirect_if_not_admin
    @movie = Movie.new
    3.times { @movie.genres.build }
    8.times { @movie.actors.build }
  end

  def create
    # redirect_if_not_admin
    movie = current_user.movies.build(movie_params)
    if movie.save
      redirect_to movie_path(movie)
    else
      render :new
    end
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  def edit
    redirect_if_not_admin
    @movie = Movie.find_by_id(params[:id])
  end

  def update
    @movie = Movie.find_by_id(params[:id])
    # only update genre and actors if info has changed. don't add duplicates
    if @movie.update(movie_params)
      # raise params.inspect

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


end
