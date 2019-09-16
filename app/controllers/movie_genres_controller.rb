class MovieGenresController < ApplicationController

  def destroy
    movie_genre = MovieGenre.find_by_id(params[:id])
    movie_genre.destroy
    redirect_to movie_path(movie_genre.movie)
  end

end
