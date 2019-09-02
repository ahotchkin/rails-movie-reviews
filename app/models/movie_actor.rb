class MovieActor < ApplicationRecord
  belongs_to :movie
  belongs_to :actor

  def self.find_movie_actor(movie, actor)
    where(:movie_id => movie, :actor_id => actor)
  end
end
