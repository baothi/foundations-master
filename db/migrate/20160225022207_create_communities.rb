class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.integer :status

      t.timestamps null: false
    end
  end
end
