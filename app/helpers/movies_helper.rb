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

  def display_genre(movie, genre)
    movie_genre = MovieGenre.find_movie_genre(movie, genre).last

    content_tag :li do
      if movie && current_user.admin
        (link_to genre.name, genre_movies_path(genre)) + " - " + (link_to "delete", movie_genre_path(movie_genre), :method => :delete)
      else
        link_to genre.name, genre_movies_path(genre)
      end
    end
  end

  def display_actor(movie, actor)
    movie_actor = MovieActor.find_movie_actor(movie, actor).last

    content_tag :li do
      if movie && current_user.admin
        (link_to actor.full_name, actor_movies_path(actor)) + " - " + (link_to "delete", movie_actor_path(movie_actor), :method => :delete)
      else
        link_to actor.full_name, actor_movies_path(actor)
      end
    end
  end

end
