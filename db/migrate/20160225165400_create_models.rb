class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :code
      t.text :description
      t.string :square_footage

      t.timestamps null: false
    end
  end
end
