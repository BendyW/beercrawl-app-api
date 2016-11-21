class Challenge < ActiveRecord::Migration[5.0]
  def change
    create_table :challenge do |table|
      table.string :challenge_name, :unique => true, :null => false
      table.string :difficulty
      table.integer :point_value
      table.string :picture
      table.integer :event_id, foreign_key: :events
    end
  end
end
