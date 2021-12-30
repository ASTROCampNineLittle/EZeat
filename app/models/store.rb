class Store < ApplicationRecord
  belongs_to :company
  has_many :dishes
end
