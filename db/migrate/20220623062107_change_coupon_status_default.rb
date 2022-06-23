class ChangeCouponStatusDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :coupons, :status, :string, default: 'preparing'
  end
end
