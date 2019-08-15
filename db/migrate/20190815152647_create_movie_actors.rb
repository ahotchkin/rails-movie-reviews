class CreateMovieActors < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_actors do |t|
      t.belongs_to :movie, foreign_key: true
      t.belongs_to :actor, foreign_key: true

      t.timestamps
    end
  end
end
