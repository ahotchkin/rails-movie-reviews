class ReviewsController < ApplicationController

  def index
    if params[:user_id] && current_user.id.to_s == params[:user_id]
      @reviews = current_user.reviews.newest_to_oldest
    elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
      @reviews = @user.reviews.newest_to_oldest
    elsif params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      @reviews = @movie.reviews.newest_to_oldest
    else
      # flash[:message] = "That movie does not exist in the database" if params[:movie_id] => needs a redirect to disappear, use @error instead?
      # if a param is passed that doesn't exist for user or movie, it stays in the url but will render all reviews
      @reviews = Review.all.newest_to_oldest
    end
  end

  def new
    if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      @review = @movie.reviews.build
    else
      @error = "That movie doesn't exist" if params[:movie_id]
      @review = Review.new
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
    @review = Review.find_by_id(params[:id])
  end

  def edit
    @review = Review.find_by_id(params[:id])
    if current_user.id == @review.user.id
      render :edit
    else
      redirect_to review_path(@review)
    end
  end

  def update
    @review = Review.find_by_id(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
      flash[:message] = "Review sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    if current_user.id == @review.user.id
      @review.delete
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
      # @review = Review.find_by_id(params[:id])
      # if !@review
      #   @error = "That review doesn't exist"
      #   redirect_to reviews_path
      # end
    end

end
