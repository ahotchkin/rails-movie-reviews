class GenresController < ApplicationController

  def index
    if params[:name]
      @genres = Genre.find_by_name(params[:name])
    else
      @genres = Genre.alpha
    end
    @movie = Movie.find_by_id(params[:id])
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

end
