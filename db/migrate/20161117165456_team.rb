class Team < ActiveRecord::Migration[5.0]
  def change
    create_table :team do |table|
      table.string :team_name, :unique => true, :null => false
      table.string :points
      table.integer :event_id, foreign_key: :event
    end
  end
end
