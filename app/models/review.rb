class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates_presence_of :rating, :title, :content
  validate :one_review_per_user_per_movie

  scope :newest_to_oldest, -> { order(:created_at => :desc) }

  def one_review_per_user_per_movie
    movie_reviews = user.reviews.select { |review| review.movie_id == self.movie_id }

    if movie_reviews.size >= 2
      errors.add(:review_id, "can't be created since you've already reviewed this movie.")
    end
  end

end
