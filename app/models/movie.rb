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
    actors_attributes.values.each do |actor_attributes|
      if !actor_attributes[:first_name].blank?
        actor = Actor.find_or_create_by(actor_attributes)
        self.actors << actor
      end
    end
  end

end
