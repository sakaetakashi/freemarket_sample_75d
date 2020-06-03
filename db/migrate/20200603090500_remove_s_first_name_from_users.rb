class RemoveSFirstNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :s_first_name, :string
  end
end
