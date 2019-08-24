class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order({ created_at: :desc })
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
      params.require(:review).permit(:content, :rating)
    end

end
