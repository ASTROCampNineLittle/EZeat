class OpenDate < ApplicationRecord
  belongs_to :dish
  has_many :offers
end
