class CreateUpgrades < ActiveRecord::Migration
  def change
    create_table :upgrades do |t|
      t.string :name
      t.string :code
      t.string :description
      t.references :client, index: true
      t.timestamps null: false
    end
  end
end
