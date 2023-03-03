class AddGenreIdToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :genre_id, :integer
  end
end
