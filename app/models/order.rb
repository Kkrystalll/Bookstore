class Order < ApplicationRecord
  include AASM

  has_one :coupon
  belongs_to :user
  has_many :book_orders
  has_many :books, through: :book_orders

  aasm column: "status" do
    state :pended, initial: true
    state :paid

    event :pay do
      transitions from: :pended, to: :paid
    end
  end
end
