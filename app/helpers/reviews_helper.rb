module ReviewsHelper

  def reviews_display_header
    if params[:user_id] && current_user.id.to_s == params[:user_id]
      content_tag(:h1, "Your Reviews")
    elsif params[:user_id] && @user
      content_tag(:h1, "#{@user.username}'s Reviews")
    elsif params[:movie_id] && @movie
      content_tag(:h1, "#{@movie.title} Reviews")
    else
      content_tag(:h1, "Movie Reviews")
    end
  end

  def write_review_for_movie_link
    link_to "Write a Review for #{@movie.title}", new_movie_review_path(@movie) if params[:movie_id] && @movie
  end

end
