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

  # def order_content(order_information)
  #   order_information.each_with_object([]) do |element,arr|
  #     book, count = element
  #     arr.push({title: book.first, price: book.last, count: count})
  #   end
  # end
end
