class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order({ created_at: :desc })
  end

  def new
    @review = Review.new
  end

  def create
    raise params.inspect
  end

  def edit
    # a user can only edit a review that belongs to them
  end


end
