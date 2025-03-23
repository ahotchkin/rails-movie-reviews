class User < ApplicationRecord
  # only admin users will have many movies
  has_many :movies
  has_many :reviews
  has_many :reviewed_movies, through: :reviews, source: :movie
  has_secure_password
  validates_presence_of :username, :email
  validates :username, :email, :uniqueness => true

  def self.from_omniauth(auth)
    user = User.find_or_create_by(:uid => auth[:uid]) do |user|
      if !User.find_by(:username => auth[:info][:first_name])
        user.username = auth[:info][:first_name]
      else
        user.username = auth[:info][:first_name] + auth[:uid]
      end
      user.email = auth[:info][:email]
      user.password = SecureRandom.hex
    end
    user
  end
  
end
