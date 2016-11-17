class Challenge < ActiveRecord::Base
  self.table_name ='challenge'
  belongs_to :event
end