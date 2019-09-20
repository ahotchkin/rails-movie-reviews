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

  # def display_movie_genres(movie)
  #   movie.genres.each do |genre|
  #     movie_genre = MovieGenre.find_movie_genre(movie, genre).last
  #
  #     if movie && current_user.admin
  #       content_tag :li, "#{link_to "#{genre.name}", genre_movies_path(genre)} - #{link_to "delete", movie_genre_path(movie_genre), :method => :delete}"
  #     else
  #       content_tag :li, "#{link_to genre.name, genre_movies_path(genre)}"
  #     end
  #     "hello"
  #   end
  # end

end
