class Movie < ApplicationRecord
  belongs_to :user
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  has_many :reviews
  has_many :users, through: :reviews
  validates_presence_of :title, :synopsis, :year

  scope :find_by_title, -> (title) { where("title LIKE ?", title) }
  scope :alpha, -> { order(:title) }

  def actors_attributes=(actors_attributes)
    actors_attributes.values.each do |actor_attributes|
      if !actor_attributes[:first_name].blank?
        actor = Actor.find_or_create_by(actor_attributes)
        if !self.actor_ids.include?(actor.id)
          self.actors << actor
        end
      end
    end
  end

  def genres_attributes=(genres_attributes)
    genres_attributes.values.each do |genre_attribute|
      if !genre_attribute[:name].blank?
        genre = Genre.find_or_create_by(genre_attribute)
        if !self.genre_ids.include?(genre.id)
          self.genres << genre
        end
      end
    end
  end

  def self.reviewed_movies
    reviewed_movies = self.all.select { |movie| movie.reviews.size > 0 }
  end

  def average_rating
    self.reviews.average(:rating).round(1) if self.reviews.size > 0
  end

  def self.sort_by_average_rating
    self.reviewed_movies.sort_by(&:average_rating)
  end

  def actor_number
    actor_number = 8 - self.actors.size
    actor_number.times { self.actors.build }
  end

  def genre_number
    genre_number = 3 - self.genres.size
    genre_number.times { self.genres.build }
  end

end
