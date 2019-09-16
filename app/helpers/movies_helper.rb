module MoviesHelper

  def movies_display_header
    if params[:actor_id]
      "#{@actor.full_name}'s Movies"
    elsif params[:genre_id]
      "#{@genre.name}"
    else
      "Movies"
    end
  end

  def edit_movie_link
    if current_user.admin
      link_to "Edit Movie", edit_movie_path(@movie), :class => "btn btn-secondary"
    end
  end

  def display_average_rating(movie)
    if movie.reviews.size >= 1
      movie.average_rating
    else
      "N/A"
    end
  end

end
