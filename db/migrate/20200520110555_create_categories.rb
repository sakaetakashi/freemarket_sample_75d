class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :genre
      t.string :subgenre
      t.string :detail
      t.timestamps
    end
  end
end
