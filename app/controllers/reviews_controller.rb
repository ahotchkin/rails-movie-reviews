class ReviewsController < ApplicationController

  def index
    if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      # nested route
      # error page if movie id doesn't exist. add logic to account for this scenario.
      @reviews = @movie.reviews.order({ created_at: :desc })
    else
      # flash[:message] = "That movie does not exist in the database" if params[:movie_id] => needs a redirect to disappear, use @error instead?
      @reviews = Review.all.order({ created_at: :desc })
    end
  end

  def new
    if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      @review = @movie.reviews.build
    else
      # @error = "That post doesn't exist" if params[:post_id]
      @review = Review.new
    end
  end

  def create
    review = current_user.reviews.build(review_params)
    if review.save
      redirect_to movie_reviews_path(review.movie)
    else
      render :new
    end
  end

  def edit
    # a user can only edit a review that belongs to them
  end

  def show
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating, :movie_id)
    end

end
