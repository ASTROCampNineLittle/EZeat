class OpenDate < ApplicationRecord
  belongs_to :dish
  has_many :orders, dependent: :destroy
  has_many :offers, dependent: :destroy
  accepts_nested_attributes_for :offers, reject_if: :all_blank, allow_destroy: true

  # scope :sort_by_availible_date_asc, lambda { order("o(date) ASC") }

  validate :date_cannot_be_in_the_past
  validates :availible_date, presence: true

  private
  def date_cannot_be_in_the_past
    if availible_date.present? && availible_date < Date.today
      errors.add(:availible_date, "can't be in the past")
    end
  end
end
