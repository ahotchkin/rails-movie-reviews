class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates_presence_of :first_name

  def full_name
    self.first_name + " " + self.last_name
  end
end
