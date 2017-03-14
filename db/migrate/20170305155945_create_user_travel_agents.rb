class CreateUserTravelAgents < ActiveRecord::Migration[5.0]
  def change
    create_table :user_travel_agents do |t|
      t.integer :user_id
      t.integer :travel_agent_id
      t.timestamps
    end
  end
end
