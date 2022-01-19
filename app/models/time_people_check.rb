class TimePeopleCheck < ApplicationRecord
  validates :order_time , presence: true
end