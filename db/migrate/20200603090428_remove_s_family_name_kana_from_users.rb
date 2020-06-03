class RemoveSFamilyNameKanaFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :s_family_name_kana, :string
  end
end
