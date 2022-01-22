class User < ApplicationRecord
  # For Devise
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  # 註冊帳號時的信箱驗證功能，開發時可先關閉
  devise :confirmable
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one :company
  has_many :orders

  validates :name, presence: true
  validates :email, uniqueness: true, if: -> { self.email.present? }
  validates :tel, presence: true, on: [:update]

  PASSWORD_FORMAT = /\A
  (?=.{6,})          # Must contain 6 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  /x

  validates :password,
    presence: true,
    length: { in: Devise.password_length },
    format: { with: PASSWORD_FORMAT },
    confirmation: true,
    on: :create

  validates :password,
    allow_nil: true,
    length: { in: Devise.password_length },
    format: { with: PASSWORD_FORMAT },
    confirmation: true,
    on: :update


  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = provider_data.info.name
      user.skip_confirmation!
    end
  end
end
