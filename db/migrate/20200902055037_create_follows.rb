class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :customer_id
      # customerテーブルから参照しないと存在しないfollowテーブルから参照してしまう
      t.references :follow, foreign_key: { to_table: :customers }

      t.timestamps
      # ペアで重複しないように設定
      t.index [:custoemr_id, :follow_id], unique: true

      t.timestamps
    end
  end
end
