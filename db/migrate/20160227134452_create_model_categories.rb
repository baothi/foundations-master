class CreateModelCategories < ActiveRecord::Migration
  def change
    create_table :model_categories do |t|
      t.references :model, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
