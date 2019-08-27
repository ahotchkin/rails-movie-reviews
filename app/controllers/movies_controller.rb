class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sort { |a, b| a.title <=> b.title }
  end

  def new
    redirect_if_not_admin
    @movie = Movie.new
    @genres = Genre.all.sort { |a, b| a.name <=> b.name }
    # User has to fill out all 5 actors to create movie. Want to add more fields but allow them to be blank.
    8.times { @movie.actors.build }
  end

  def create
    # redirect_if_not_admin
    movie = current_user.movies.build(movie_params)
    raise params.inspect

    # add code to create a new genre if genre field is filled in
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
      params.require(:movie).permit(:title, :synopsis, :year, :genre_id, :genre_attributes => [:name], :actors_attributes => [:first_name, :last_name])
    end


end
