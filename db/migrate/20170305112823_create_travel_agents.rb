class CreateTravelAgents < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_agents do |t|
      t.string :name
      t.timestamps
    end
  end
end
