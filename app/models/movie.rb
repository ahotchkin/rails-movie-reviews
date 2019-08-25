class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :reviews
  has_many :users, through: :reviews
  validates_presence_of :title, :synopsis, :year

  accepts_nested_attributes_for :actors

  def actor_attributes=(actor)
    self.actor = Actor.find_or_create_by(:first_name => actor[:first_name], :last_name => actor[:last_name])
    self.actor.update(actor)
  end
end
