class AddMovieCountToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :movie_count, :integer
  end
end
