class User < ActiveRecord::Migration[5.0]
  def change
    create_table :user do |table|
      table.string :user_name
      table.string :email
      table.string :password_hash
    end
  end
end
