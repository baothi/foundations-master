class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :name
      t.string :code
      t.text :description
      t.references :client, index: true
      t.references :category, index: true
      t.timestamps null: false
    end
  end
end
