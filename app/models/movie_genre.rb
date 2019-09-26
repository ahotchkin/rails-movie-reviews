class MovieGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre, :counter_cache => :movie_count

  def self.find_movie_genre(movie, genre)
    where(:movie_id => movie, :genre_id => genre)
  end
  
end
