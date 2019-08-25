class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :reviews
  has_many :users, through: :reviews
  validates_presence_of :title, :synopsis, :year

  accepts_nested_attributes_for :genre
  # accepts_nested_attributes_for :actors
end
