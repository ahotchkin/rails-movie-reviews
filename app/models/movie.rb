class Movie < ApplicationRecord
  belongs_to :user
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  has_many :reviews
  has_many :users, through: :reviews
  validates_presence_of :title, :synopsis, :year

  def actors_attributes=(actors_attributes)
    # binding.pry
    actors_attributes.values.each do |actor_attributes|
      # should ignore the field if the actor id is already included in self.actor_ids, but instead is adding the actor again
      if !actor_attributes[:first_name].blank? && !self.actor_ids.include?(actor_attributes[:id])
        actor = Actor.find_or_create_by(actor_attributes)
        self.actors << actor
      end
    end
  end

  def genres_attributes=(genres_attributes)
    genres_attributes.values.each do |genre_attribute|
      if !genre_attribute[:name].blank?
        genre = Genre.find_or_create_by(genre_attribute)
        self.genres << genre
      end
    end
  end

end
