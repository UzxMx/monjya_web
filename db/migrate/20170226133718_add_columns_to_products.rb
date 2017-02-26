class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :journey, :text
    add_column :products, :play_method, :text
  end
end
