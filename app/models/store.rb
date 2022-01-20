class Store < ApplicationRecord
  belongs_to :company
  has_many :dishes
  has_many :orders

  accepts_nested_attributes_for :dishes

  enum food_type: [:中式, :日式, :韓式, :印度, :義式, :英式, :美式, :法式, :德式, :墨西哥, :其它]

  mount_uploader :image, ImageUploader

  validates :name, :food_type, :tel, :address, :intro, presence: true

  def self.search(search_term)
    return all unless search_term.present?
      where(['name LIKE ?', "%#{search_term}%"])
  end
end
