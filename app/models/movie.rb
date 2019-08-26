class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :reviews
  has_many :users, through: :reviews
  validates_presence_of :title, :synopsis, :year

  def actors_attributes=(actor_attributes)
    actor_attributes.values.each do |actor_attribute|
      if !actor_attribute[:first_name].blank?
        actor = Actor.find_or_create_by(actor_attribute) if !actor_attribute.blank?
        self.actors << actor
      end
    end
  end

end
