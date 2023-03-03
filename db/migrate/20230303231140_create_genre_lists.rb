class CreateGenreLists < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_lists do |t|
      t.string :genre_name

      t.timestamps
    end
  end
end
