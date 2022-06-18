class AddAmountToCoupon < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :piece, :integer, default: 1
  end
end
