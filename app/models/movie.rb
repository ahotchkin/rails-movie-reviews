class Movie < ApplicationRecord
  belongs_to :genre
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :reviews
  has_many :users, through: :reviews
end
