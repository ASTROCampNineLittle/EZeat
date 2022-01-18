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
  has_many :orders

  # after_create :welcome_users

  # def welcome_users
  #   UserMailer.greeting_mails(self).deliver_now
  # end

  # def self.check_omniauth(auth)
  #   where(google_token: , google_uid: google_uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.name = auth.info.name
  #   end
  # end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = provider_data.info.name
    end
  end

end
