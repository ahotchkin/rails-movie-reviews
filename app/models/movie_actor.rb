class MovieActor < ApplicationRecord
  belongs_to :movie
  belongs_to :actor, :counter_cache => :movie_count

  def self.find_movie_actor(movie, actor)
    where(:movie_id => movie, :actor_id => actor)
  end
  
end
