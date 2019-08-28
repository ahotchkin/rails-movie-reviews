class MovieActorsController < ApplicationController

  def destroy
    # it's taking the id from the actor, not the movie_actor
    raise params.inspect

    movie_actor = MovieActor.find_by_id(params[:id])
    movie_actor.delete
    redirect_to movie_path(movie_actor.movie)


  end

  # def destroy
  #   GroupShot.where(params[:shot_id], params[:group_id]).delete
  # end

  private

    def movie_actor_params
      params.require(:movie_actor).permit(:movie_id, :actor_id)
    end

end
