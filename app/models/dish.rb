class Dish < ApplicationRecord
  belongs_to :store
  has_many :open_dates

  has_many :images, class_name: "DishImage"
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

end
