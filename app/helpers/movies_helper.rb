module MoviesHelper

  def edit_movie_link
    if current_user.admin
      link_to "Edit Movie", edit_movie_path(@movie)
    end
  end

  def display_average_rating(movie)
    if movie.reviews.count >= 1
      movie.average_rating
    else
      "N/A"
    end
  end

end
