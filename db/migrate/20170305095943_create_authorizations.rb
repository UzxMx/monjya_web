class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.integer :user_id
      t.string :provider_name, :provider_uid
      t.string :name, :image
      t.string :auth_raw, limit: 4096

      t.timestamps
    end

    add_index :authorizations, :user_id
    add_index :authorizations, [:provider_name, :provider_uid], unique: true
  end
end
