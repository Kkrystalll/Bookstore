class Coupon < ApplicationRecord
  include AASM

  validates :title, presence: true
  validates :discount_method, presence: true
  validates :piece, presence: true, numericality: { greater_than: 0 }

  belongs_to :order, optional: true
  has_many :user_coupons
  has_many :users, through: :user_coupons, dependent: :destroy

  enum discount_method: { 九折: 1, 八折: 2, 七折: 3, 折抵20元: 4, 折抵100元: 5, 折抵300元: 6 }

  aasm column: "status" do
    state :preparing, initial: true
    state :publishing
    state :expired

    event :publish do
      transitions from: :preparing, to: :publishing
    end

    event :expiry do
      transitions from: :publishing, to: :expired
    end
  end

  after_find do |coupon|
    if coupon.preparing? && coupon.start_date <= Time.now 
      coupon.publish
    end
    if coupon.publishing? && coupon.expiry_date? && Time.now >= coupon.expiry_date
      coupon.expiry
    end 
  end

  def self.discount_method_select
    discount_methods.keys.map { |key| [key, key] }
  end

  def self.all_status
    [
      %w[發佈 published],
      %w[到期 expired]
    ]
  end

end

