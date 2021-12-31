class Company < ApplicationRecord
  has_many :stores
  belongs_to :users
end
