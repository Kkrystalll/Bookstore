class Coupon < ApplicationRecord
  validates :title, presence: true
  validates :discount_method, presence: true
  validates :piece, presence: true, numericality: { greater_than: 0 }

  has_many :orders
  has_many :user_coupons
  has_many :users, through: :user_coupons

  enum discount_method: { 請選折折扣: 0, 九折: 1, 八折: 2, 七折: 3, 折抵20元: 4, 折抵100元: 5 }

  def self.discount_method_select
    discount_methods.keys.map { |key| [key, key] }
  end

end
