class GenresController < ApplicationController

  def index
    # add method to alphabetize
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

end
