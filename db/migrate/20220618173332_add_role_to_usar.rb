class AddRoleToUsar < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string, default: 'user'
    add_column :coupons, :status, :string, default: 'published'
  end
end
