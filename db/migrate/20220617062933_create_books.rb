class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false, unique: true
      t.integer :price

      t.timestamps
    end
  end
end
