class Dish < ApplicationRecord
  belongs_to :store

  has_many :open_dates, dependent: :destroy
  accepts_nested_attributes_for :open_dates, reject_if: :all_blank, allow_destroy: true

  has_many :images, class_name: "DishImage", dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, :price, :status, presence: true

  # 未方便假資料植入，先關掉必填
  # validates :intro
end
