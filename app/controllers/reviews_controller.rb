class ReviewsController < ApplicationController

  helper_method :current_review
  before_action :current_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movies_array, only: [:new, :create]

  def index
    set_reviews_array
  end

  def new
    if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      @review = @movie.reviews.build
    else
      @error = "That movie doesn't exist." if params[:movie_id]
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id == current_review.user.id
      render :edit
    else
      redirect_to reviews_path
    end
  end

  def update
    if current_review.update(review_params)
      redirect_to review_path(current_review)
      flash[:message] = "Review successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == current_review.user.id
      current_review.delete
      flash[:message] = "Review successfully deleted."
    end
    redirect_to reviews_path
  end

  private
    def review_params
      params.require(:review).permit(:title, :content, :rating, :movie_id)
    end

    def current_review
      review = Review.find_by_id(params[:id])
    end

    def set_movies_array
      @movies = Movie.alpha
    end

    def set_reviews_array
      if params[:user_id] && current_user.id.to_s == params[:user_id]
        @reviews = current_user.reviews.newest_to_oldest
      elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
        @reviews = @user.reviews.newest_to_oldest
      elsif params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
        @reviews = @movie.reviews.newest_to_oldest
      else
        @error = "That movie doesn't exist." if params[:movie_id]
        @error = "That user doesn't exist." if params[:user_id]
        @reviews = Review.all.newest_to_oldest
      end
    end

end
