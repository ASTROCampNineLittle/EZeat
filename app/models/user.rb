class User < ApplicationRecord
  # For Devise
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  validates :name, :tel, presence: true
  validates :email, uniqueness: true, if: -> { self.name.present? }

  has_one :company
end
