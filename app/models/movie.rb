class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :reviews
  has_many :users, through: :reviews
  validates_presence_of :title, :synopsis, :year

  def actors_attributes=(actors_full_names)
    actors_full_names.values.each do |actor_full_name|
      if !actor_full_name[:first_name].blank?
        actor = Actor.find_or_create_by(actor_full_name)
        self.actors << actor
      end
    end
  end

end
