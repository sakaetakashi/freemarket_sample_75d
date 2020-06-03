class RemoveSFirstNameKanaFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :s_first_name_kana, :string
  end
end
