class OpenDate < ApplicationRecord
  belongs_to :dish
  has_many :orders
  has_many :offers, dependent: :destroy
  accepts_nested_attributes_for :offers, reject_if: :all_blank, allow_destroy: true

  validate :date_cannot_be_in_the_past
  validates :availible_date, presence: true

  private
  def date_cannot_be_in_the_past
    if availible_date.present? && availible_date < Date.today
      errors.add(:availible_date, "can't be in the past")
    end
  end
end
