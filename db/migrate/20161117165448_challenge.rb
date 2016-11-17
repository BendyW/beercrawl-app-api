class Challenge < ActiveRecord::Migration[5.0]
  def change
    create_table :challenge do |table|
      table.string :challenge_name
      table.string :difficulty
      table.integer :point_value
      table.string :picture
    end
  end
end
