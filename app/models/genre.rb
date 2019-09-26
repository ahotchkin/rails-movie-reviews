class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres, :dependent => :destroy
  validates_presence_of :name

  scope :alpha, -> { order(:name) }
  scope :find_by_name, -> (name) { where("name LIKE ?", name) }
  
end
