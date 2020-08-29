class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :customer, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
      t.index [:customer_id, :movie_id], unique: true
    end
  end
end
