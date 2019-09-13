class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates_presence_of :first_name

  scope :find_by_first_name, -> (first_name) { where("first_name LIKE ?", first_name) }
  scope :find_by_last_name, -> (last_name) { where("last_name LIKE ?", last_name) }

  def self.sorted_actors
    self.all.sort do |a, b|
      if a.last_name != "" && b.last_name != ""
        a.last_name <=> b.last_name
      elsif a.last_name != "" && b.last_name == ""
        a.last_name <=> b.first_name
      elsif a.last_name == "" && b.last_name != ""
        a.first_name <=> b.last_name
      elsif a.last_name == "" && b.last_name == ""
        a.first_name <=> b.first_name
      end
    end
  end

  def full_name
    if self.last_name
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end

  def number_of_movies
    self.movies.count
  end

end
