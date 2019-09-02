class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres
  validates_presence_of :name

  scope :alpha, -> { order(:name) }
end
