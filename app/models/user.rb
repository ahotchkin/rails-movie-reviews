class User < ApplicationRecord
  has_many :reviews
  has_many :movies, through: :reviews
  has_secure_password
  validates_presence_of :username, :email
end
