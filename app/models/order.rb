class Order < ApplicationRecord
  belongs_to :open_date
  belongs_to :user
  belongs_to :store

  include AASM

  aasm(:order_status, namespace: :order, column: "order_status") do
    state :pending, initial: true
    state :succeded, :failed

    event :succed do
      transitions from: :pending, to: :succeded
    end

    event :fail do
      transitions from: :pending, to: :failed
    end
  end

  scope order_date: { where("order_date < ?", Time.now) }
  def overdue?
    overdue < Time.now
  end

  # aasm(:ticket, column: "ticket") do
  #   state :waiting, initial: true
  #   state :opend, :closed

  #   event :open do
  #     transitions from: :waiting, to: :opened
  #   end

  #   event :close do
  #     transitions from: :opened, to: :closed
  #   end
  # end
end