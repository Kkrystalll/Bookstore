class AddOrderReferencesToCoupon < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :coupon_id, :integer
    add_index :orders, :coupon_id
  end
end
