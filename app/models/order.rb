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

  def price_calculation(discount_method, amount)
    case discount_method
    when "九折"
      amount * 0.9
    when "八折"
      amount * 0.8
    when "七折"
      amount * 0.7
    when "折抵20元"
      amount - 20
    when "折抵100元"
      amount - 100
    when "折抵300元"
      amount - 300
    end
  end

  def positive_amount(amount)
    if amount >= 0
      amount
    else
      amount = 0
    end
  end
end
