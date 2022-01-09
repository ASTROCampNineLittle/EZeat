class Order < ApplicationRecord
  include AASM

  aasm column: :order_state do
    state :pending, initial: true
    state :paid, :reserved, :refunded, :used

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :reserve do
      transitions from: :paid, to: :reserved
    end

    event :use do
      transitions from: :reserved, to: :used
    end

    event :refund do
      transitions from: [:paid, :reserved], to: :refunded
    end
  end

end