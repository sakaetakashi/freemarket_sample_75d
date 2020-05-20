class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :post_code
      t.string :prefecture
      t.string :city
      t.string :block
      t.text :building
      t.integer :telephone_number
      t.integer :user_id
      t.timestamps
    end
  end
end
