class GenresController < ApplicationController

  def show
    @genre = Genre.find_by_id(params[:id])
  end

end
