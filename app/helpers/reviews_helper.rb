module ReviewsHelper

  def new_review_header
    if @review.movie
      "New Review for #{@review.movie.title}"
    else
      "New Review"
    end
  end

  def reviews_display_header
    if params[:user_id] && current_user.id.to_s == params[:user_id]
      "Your Reviews"
    elsif params[:user_id] && @user
      "#{@user.username}'s Reviews"
    elsif params[:movie_id] && @movie
      "#{@movie.title} Reviews"
    else
      "Movie Reviews"
    end
  end

  def display_review_title_link(review)
    link_to "#{review.title}", review_path(review)
  end

  def write_review_for_movie_link
    link_to "Write a Review for #{@movie.title}", new_movie_review_path(@movie) if params[:movie_id] && @movie
  end

end
