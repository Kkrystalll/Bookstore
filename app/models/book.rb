class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { genter_then: 0 }
end
