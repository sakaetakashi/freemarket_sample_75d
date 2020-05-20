class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :card_owner
      t.integer :card_number
      t.date :limit_month
      t.date :limit_year
      t.integer :security_code
      t.string :company
      t.integer :user_id
      t.timestamps
    end
  end
end
