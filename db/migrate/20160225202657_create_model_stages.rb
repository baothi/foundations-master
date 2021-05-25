class CreateModelStages < ActiveRecord::Migration
  def change
    create_table :model_stages do |t|
      t.references :model, index: true, foreign_key: true
      t.references :stage, index: true, foreign_key: true
      # t.string :file_id
      # t.string :name
      # t.references :imageable, polymorphic: true, index: true
      t.string :stage_image_id
      t.timestamps null: false
    end
  end
end
