class Event < ActiveRecord::Migration[5.0]
  def change
    create_table :event do |table|
      table.string :event_name
      table.string :bar_crawl
      table.datetime :start_time
      table.integer :challenge_id #fk
      table.integer :team_id #fk
    end
  end
end
