class AddMovieCountToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :movie_count, :integer
  end
end
