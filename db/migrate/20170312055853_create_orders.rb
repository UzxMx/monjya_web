class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.date :start_date
      t.string :start_place
      t.string :visitors
      t.float :price
      t.integer :status
      t.timestamps
    end
  end
end
