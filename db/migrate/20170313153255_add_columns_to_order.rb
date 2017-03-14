class AddColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :oid, :string
    add_index :orders, :oid, unique: true
    add_index :orders, :user_id
    add_index :orders, :product_id
  end
end
