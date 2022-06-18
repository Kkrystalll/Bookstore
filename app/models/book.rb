class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { genter_then: 0 }

  belongs_to :user
  has_many :book_orders
  has_many :orders, through: :book_orders
end