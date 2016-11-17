class Team < ActiveRecord::Migration[5.0]
  def change
    create_table :team do |table|
      table.string :team_name
      table.string :user_id #fk
      table.string :points
    end
  end
end
