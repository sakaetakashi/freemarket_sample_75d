class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :explain
      t.integer :price
      t.string :brand
      t.text :condition
      t.string :arrive_at
      t.integer :shipping_fee
      t.string :region
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
