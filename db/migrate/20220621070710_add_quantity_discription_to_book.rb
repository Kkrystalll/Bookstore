class AddQuantityDiscriptionToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :discription, :text
    add_column :book_orders, :book_quantity, :integer, default: 1
  end
end
