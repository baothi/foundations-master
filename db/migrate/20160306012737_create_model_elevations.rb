class CreateModelElevations < ActiveRecord::Migration
  def change
    create_table :model_elevations do |t|
      t.references :model, index: true, foreign_key: true
      t.references :elevation, index: true, foreign_key: true
      t.string :elevation_image_id

      t.timestamps null: false
    end
  end
end
