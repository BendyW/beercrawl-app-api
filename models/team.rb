class Team < ActiveRecord::Base
  self.table_name ='team'
  has_many :users
end