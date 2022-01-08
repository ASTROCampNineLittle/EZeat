class OpenDate < ApplicationRecord
  belongs_to :dish
  has_many :offers

  validate :date_cannot_be_in_the_past

  private
  def date_cannot_be_in_the_past
    if availible_date.present? && availible_date < Date.today
      errors.add(:availible_date, "can't be in the past")
    end
  end 
end
