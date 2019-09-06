class AddDefaultYearToMovies < ActiveRecord::Migration[5.2]
  def change
    change_column_default :movies, :year, Time.now.year.to_s
  end
end
