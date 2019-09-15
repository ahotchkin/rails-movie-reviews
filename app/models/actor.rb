class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates_presence_of :first_name

  scope :find_by_first_name, -> (first_name) { where("first_name LIKE ?", first_name) }
  scope :find_by_last_name, -> (last_name) { where("last_name LIKE ?", last_name) }

  def full_name
    if self.last_name
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end

  # # refactor - used in actor and genre
  def number_of_movies
    self.movies.size
  end
  #
  # def self.sort_by_number_of_movies
  #   self.all.sort do |a, b|
  #     a.number_of_movies <=> b.number_of_movies
  #   end
  # end

end
