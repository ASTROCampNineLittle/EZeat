class Company < ApplicationRecord
  has_many :stores
  belongs_to :user

  # private

  # def set_users_role
  #   user.role_id = '2' if user.role_id.nil?
  # end
end
