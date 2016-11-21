class Event < ActiveRecord::Migration[5.0]
  def change
    create_table :event do |table|
      table.string :event_name, :unique => true, :null => false
      table.string :bar_crawl, :null => false
      table.datetime :start_time, :null => false
      table.integer :challenge_id #fk
      table.integer :team_id #fk
    end
  end
end
