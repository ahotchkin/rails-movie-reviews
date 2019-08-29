class ActorsController < ApplicationController

  def show
    @actor = Actor.find_by_id(params[:id])
  end

end
