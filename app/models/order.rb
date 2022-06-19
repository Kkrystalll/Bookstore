class Order < ApplicationRecord
  has_one :coupon
  belongs_to :user
  has_many :book_orders
  has_many :books, through: :book_orders

end
