class User < ApplicationRecord
  # only admin users will have many movies
  has_many :movies
  has_many :reviews
  has_many :reviewed_movies, through: :reviews, source: :movie
  has_secure_password
  validates_presence_of :username, :email
end
