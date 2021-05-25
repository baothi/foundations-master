class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_id
      t.boolean :featured
      t.references :imageable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
