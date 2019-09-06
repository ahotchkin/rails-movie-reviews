module MoviesHelper

  def edit_movie_link
    if current_user.admin
      link_to "Edit Movie", edit_movie_path(current_movie)
    end
  end

end
