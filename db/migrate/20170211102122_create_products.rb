class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brief_description
      t.string :address
      t.string :open_time
      t.float :price
      t.text :details
      t.float :rate
      t.integer :state, default: 0
      t.integer :thumb_photo_id

      t.timestamps
    end
  end
end
