class ReviewsController < ApplicationController

  helper_method :current_review

  def index
    if params[:user_id] && current_user.id.to_s == params[:user_id]
      @reviews = current_user.reviews.newest_to_oldest
    elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
      @reviews = @user.reviews.newest_to_oldest
    elsif params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      @reviews = @movie.reviews.newest_to_oldest
    else
      @reviews = Review.all.newest_to_oldest
    end
  end

  def new
    # is there a way to user current_movie helper method here?
    if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      @review = @movie.reviews.build
    else
      @error = "That movie doesn't exist" if params[:movie_id]
      @review = Review.new
      @movies = Movie.alpha
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to movie_reviews_path(@review.movie)
    else
      render :new
    end
  end

  def show
  end

  def edit
    # tried using @review helper method, but error messages don't show up when I do
    # @review = Review.find_by_id(params[:id])
    if current_user.id == current_review.user.id
      render :edit
    else
      redirect_to review_path(current_review)
    end
  end

  def update
    # @review = Review.find_by_id(params[:id])

    if current_review.update(review_params)
      redirect_to review_path(current_review)
      flash[:message] = "Review sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == current_review.user.id
      current_review.delete
    else
      flash[:message] = "You do not have the authority to delete this review. Shame on you."
    end
    redirect_to reviews_path
  end

  private
    def review_params
      params.require(:review).permit(:title, :content, :rating, :movie_id)
    end

    def current_review
      @review = Review.find_by_id(params[:id])
      # if !@review
      #   @error = "That review doesn't exist"
      #   redirect_to reviews_path
      # end
    end

end
