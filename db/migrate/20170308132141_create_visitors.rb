class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :name, :telephone
      t.integer :user_id
      t.timestamps
    end
  end
end
