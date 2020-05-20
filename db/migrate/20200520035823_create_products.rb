class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :product_name
      t.text :explain
      t.integer :price
      t.text :brand
      t.text :condition
      t.date :arrive_at
      t.string :shipping_method
      t.integer :shipping_fee
      t.string :region
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
