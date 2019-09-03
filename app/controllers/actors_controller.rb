class ActorsController < ApplicationController

  def index
    if params[:first_name] && params[:last_name] == ""
      @actors = Actor.find_by_first_name(params[:first_name])
    elsif params[:first_name] == "" && params[:last_name]
      @actors = Actor.find_by_last_name(params[:last_name])
    elsif params[:first_name] && params[:last_name]
      @actors = Actor.find_by_first_name(params[:first_name]) && Actor.find_by_last_name(params[:last_name])
    else
      @actors = Actor.sorted_actors
    end
  end

  def show
    @actor = Actor.find_by_id(params[:id])
  end

  private

    def actor_params
      params.require(:actor).permit(:first_name, :last_name)
    end

end
