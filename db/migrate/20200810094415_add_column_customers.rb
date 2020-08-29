class AddColumnCustomers < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :user_id, :string
  	add_column :customers, :customer_name, :string
  	add_column :customers, :profile, :text
  	add_column :customers, :image_id, :string
  	add_column :customers, :customer_status,:boolean, default: true, null: false
  end
end
