class CreateMovieGenreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_genre_relations do |t|

    	# FK
    	t.integer :movie_id, default:""
    	t.integer :genre_id, default: ""

      t.timestamps
    end
  end
end
