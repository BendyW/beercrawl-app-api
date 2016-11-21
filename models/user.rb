class User < ActiveRecord::Base
  self.table_name ='user'
  belongs_to :team
end