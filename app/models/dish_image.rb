class DishImage < ApplicationRecord

mount_uploader :image, DishImageUploader
belongs_to :dish
end
