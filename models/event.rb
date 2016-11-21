class Event < ActiveRecord::Base
  self.table_name = 'event'
  has_many :challenges
end