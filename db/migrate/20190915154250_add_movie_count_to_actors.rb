class AddMovieCountToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :movie_count, :integer, :null => false, :default => 0
  end
end
