class User < ApplicationRecord
  # For Devise
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  # 註冊帳號時的信箱驗證功能，開發時可先關閉
  devise :confirmable
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :name, :tel, presence: true
  validates :email, uniqueness: true, if: -> { self.email.present? }

  has_one :company

  def self.check_omniauth(auth)
    where(google_token: , google_uid: google_uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

end
