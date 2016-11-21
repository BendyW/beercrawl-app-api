class User < ActiveRecord::Migration[5.0]
  def change
    create_table :user do |table|
      table.string :user_name, :unique => true, :null => false
      table.string :email, :unique => true, :null => false
      table.string :password_hash, :null => false
      table.integer :team_id, foreign_key: :team
    end
  end
end
