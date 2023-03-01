class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :cover
      t.string :title
      t.integer :author_id
      t.text :synoposis
      t.date :publication_date

      t.timestamps
    end
  end
end
