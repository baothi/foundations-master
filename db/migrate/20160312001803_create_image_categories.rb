class CreateImageCategories < ActiveRecord::Migration
  def change
    create_table :image_categories do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
