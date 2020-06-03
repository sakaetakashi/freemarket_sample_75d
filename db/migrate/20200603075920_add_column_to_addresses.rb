class AddColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :s_family_name, :string
    add_column :addresses, :s_first_name, :string
    add_column :addresses, :s_family_name_kana, :string
    add_column :addresses, :s_first_name_kana, :string
  end
end
