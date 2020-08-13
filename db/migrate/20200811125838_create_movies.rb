class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|

    	#FK
		t.integer :customer_id, null: false, default: ""
		t.integer :genre_id, null: false, default: ""

		t.string :title, null: false, default: ""
		t.text :impression
		t.string :movie_image_id
		t.float :rate, null: false, default: ""
		t.boolean :netflix, null: false, default: "true"
		t.boolean :amazon, null: false, default: "true"
		t.boolean :hule, null: false, default: "true"

      t.timestamps
    end
  end
end
