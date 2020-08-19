class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|

		t.string :title, default: ""
		t.text :impression, default: ""
		t.float :rate, default: "3"
		t.string :movie_image_id
		t.boolean :netflix, default: "true"
		t.boolean :amazon, default: "true"
		t.boolean :hulu, default: "true"

      t.timestamps
    end
  end
end
