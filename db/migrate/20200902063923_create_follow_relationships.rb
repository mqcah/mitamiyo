class CreateFollowRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_relationships do |t|
      t.references :follower, foreign_key: { to_table: :customers }
      t.references :following, foreign_key: { to_table: :customers }

      t.timestamps
    end
    add_index :follow_relationships, [:follower_id, :following_id], unique: true
  end
end
