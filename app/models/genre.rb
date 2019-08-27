class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres
  validates_presence_of :name

  # before_validation :create_genre_from_name
  #
  # def def create_genre_from_name
  #   self.name = new_genre_name if !new_genre_name.blank?
  # end
end
