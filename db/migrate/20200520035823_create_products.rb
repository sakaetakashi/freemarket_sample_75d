class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.string :brand
      t.text :condition, null: false
      t.string :arrive_at, null: false
      t.string :shipping_fee, null: false
      t.integer :region_id, null: false
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
