class GenresController < ApplicationController

  def index
    @genres = Genre.alpha
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

end
