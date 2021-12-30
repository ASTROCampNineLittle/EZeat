class Dish < ApplicationRecord
  belongs_to :store
  has_many :open_dates
end
