class User < ApplicationRecord
  # For Devise
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 註冊帳號時的信箱驗證功能，開發時可先關閉
  # devise :confirmable
  
  validates :name, :tel, presence: true
  validates :email, uniqueness: true, if: -> { self.email.present? }

  has_one :company
end
