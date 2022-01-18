class TimePeopleCheck < ApplicationRecord
  validate :order_time , presence: true
end