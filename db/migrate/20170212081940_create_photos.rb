class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :key
      t.integer :width, :height, :file_size
      t.integer :user_id
      t.timestamps
    end

    add_index :photos, :key, unique: true
  end
end
