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
      "All Movie Reviews"
    end
  end

  def display_review_title_link(review)
    (link_to "#{review.title}", review_path(review)).html_safe + tag(:br) if !params[:id]
  end

  def display_movie_link_in_review(review)
    "Movie: #{link_to review.movie.title, movie_path(review.movie)}".html_safe + tag(:br) if !params[:movie_id]
  end
  
  def display_user_link_in_review(review)
    "Written by: #{link_to review.user.username, user_reviews_path(review.user)}".html_safe + tag(:br) if !params[:user_id]
  end

  def review_date(review)
    review.created_at.strftime("%B %d, %Y")
  end

  def display_review_content(review)
    params[:id] ? review.content : review.content.truncate(350)
  end

  def display_edit_and_delete_links(review)
    if current_user.id.to_s == params[:user_id] || current_user.id == review.user.id
      "#{link_to "Edit Review", edit_review_path(review)} |
      #{link_to "Delete Review", review_path(review), :method => :delete}".html_safe + tag(:br)
    end
  end

  def write_review_for_movie_link
    link_to "Write a Review", new_movie_review_path(@movie), :class => "btn btn-secondary" if params[:movie_id] && @movie
  end

  def no_reviews_message
    content_tag :span, "Be the first to review #{@movie.title}.".html_safe + tag(:br) + tag(:br) if @reviews.empty?
  end

end
