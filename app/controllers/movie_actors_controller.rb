class MovieActorsController < ApplicationController

  def destroy
    movie_actor = MovieActor.find_by_id(params[:id])
    movie_actor.delete
    redirect_to movie_path(movie_actor.movie)
  end

end
