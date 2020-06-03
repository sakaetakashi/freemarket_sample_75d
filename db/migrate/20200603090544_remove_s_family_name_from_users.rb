class RemoveSFamilyNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :s_family_name, :string
  end
end
