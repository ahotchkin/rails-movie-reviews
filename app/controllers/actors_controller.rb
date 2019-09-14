class ActorsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    set_actors_array
    @movie = Movie.find_by_id(params[:id])
  end

  def show
    @actor = Actor.find_by_id(params[:id])
  end

  private

    def set_actors_array
      if params[:first_name] && params[:last_name] == ""
        @actors = Actor.find_by_first_name(params[:first_name])
      elsif params[:first_name] == "" && params[:last_name]
        @actors = Actor.find_by_last_name(params[:last_name])
      elsif params[:first_name] && params[:last_name]
        @actors = Actor.find_by_first_name(params[:first_name]) && Actor.find_by_last_name(params[:last_name])
      else
        @actors = Actor.order(sort_column + " " + sort_direction)
      end
    end

    def sort_column
      Actor.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
    end

    def sort_direction
      %w[asc, desc].include?(params[:direction])? params[:direction] : "asc"
    end

end
