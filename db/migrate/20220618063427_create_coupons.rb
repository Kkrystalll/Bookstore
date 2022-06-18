class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :title
      t.datetime :start_date, default: -> { 'NOW()' }
      t.datetime :expiry_date
      t.integer :discount_method, default: 0

      t.timestamps
    end
  end
end
