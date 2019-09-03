class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates_presence_of :title, :content, :rating
  validate :one_review_per_user_per_movie

  def one_review_per_user_per_movie
    user_movies = user.reviews.map { |review| review.movie_id }

    if user_movies.include?(self.movie_id)
      errors.add(:review_id, "can't be created since you've already reviewed this movie.")
    end
  end

  def review_date
    self.created_at.strftime("%B %d, %Y")
  end

end
