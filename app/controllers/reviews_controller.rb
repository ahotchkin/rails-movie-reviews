class ReviewsController < ApplicationController

  def index
    if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
      # nested route
      # should display movie title at the top of the page
      @reviews = @movie.reviews.order({ created_at: :desc })
    else
      # flash[:message] = "That movie does not exist in the database" if params[:movie_id] => needs a redirect to disappear, use @error instead?
      @reviews = Review.all.order({ created_at: :desc })
    end
  end

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    raise params.inspect
  end

  def edit
    # a user can only edit a review that belongs to them
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating, :movie_id)
    end

end
