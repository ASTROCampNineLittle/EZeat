class Company < ApplicationRecord
  has_many :stores
  belongs_to :user

  validates :name, :address, :tel, :manager_name, presence: true

  #   scope :search, -> (keyword) {
  #   # where("name like :q OR Store.food_type like :q', q: "%#{keyword}%") if keyword.present?
  #   where('stores.address like :q', q: "%#{keyword}%") if keyword.present?
  #   # { where("name like ?", "#{keyword}") if keyword.present?
  # }

  #   scope :search, -> (keyword) {
  #   # where("name like :q OR Store.food_type like :q', q: "%#{keyword}%") if keyword.present?
  #   where('stores.address like :q', q: "%#{keyword}%") if keyword.present?
  #   # { where("name like ?", "#{keyword}") if keyword.present?
  # }

  # private

  # def set_users_role
  #   user.role_id = '2' if user.role_id.nil?
  # end
end
