class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres
  validates_presence_of :name

  scope :alpha, -> { order(:name) }
  scope :find_by_name, -> (name) { where("name LIKE ?", name) }

  # # refactor - used in actor and genre
  def number_of_movies
    self.movies.size
  end

end
