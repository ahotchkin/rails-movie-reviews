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

  # def sort_rating_column
  #   Movie.sort_by_average_rating
  # end

  # def sort_average_rating
  #   # direction = sort_direction == "asc" ? "desc" : "asc"
  #   # direction = sort_rating_column
  #   # link_to "Average Rating", average_rating_asc_path, :onclick => remote_fuction(:controller => "movies_controller", :action => "sort_rating_column")
  #   link_to "Average Rating", sort_rating_column_movies_path
  #   # radio_button :model, :method, :onclick =>
  #   # remote_function(:controller => ‘some’, :action => ‘action’)
  # end

end
