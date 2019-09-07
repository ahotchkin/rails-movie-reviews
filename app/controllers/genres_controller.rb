class GenresController < ApplicationController

  def index
    @genres = Genre.alpha
    @movie = Movie.find_by_id(params[:id])
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

end
