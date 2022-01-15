class Company < ApplicationRecord
  has_many :stores
  belongs_to :user

  validates :name, :address, :tel, :manager_name, presence: true



  # private

  # def set_users_role
  #   user.role_id = '2' if user.role_id.nil?
  # end
end
