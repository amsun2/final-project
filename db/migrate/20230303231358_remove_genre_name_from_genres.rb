class RemoveGenreNameFromGenres < ActiveRecord::Migration[6.0]
  def change
    remove_column :genres, :genre
  end
end
