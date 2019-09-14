class GenresController < ApplicationController

  helper_method :sort_column
  
  def index
    if params[:name]
      @genres = Genre.find_by_name(params[:name])
    else
      @genres = Genre.order(sort_column + " " + sort_direction)
    end
    @movie = Movie.find_by_id(params[:id])
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

  private

    def sort_column
      Genre.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end


end
