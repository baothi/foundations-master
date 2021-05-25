class CreateClientImages < ActiveRecord::Migration
  def change
    create_table :client_images do |t|
      t.references :client, index: true
      t.references :stage, index: true
      t.timestamps null: false
    end
  end
end
