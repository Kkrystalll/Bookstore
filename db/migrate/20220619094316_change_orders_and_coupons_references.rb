class ChangeOrdersAndCouponsReferences < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :coupon
    add_reference :coupons, :order, index: true, foreign_key: true
  end
end
