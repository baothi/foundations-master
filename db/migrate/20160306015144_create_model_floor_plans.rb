class CreateModelFloorPlans < ActiveRecord::Migration
  def change
    create_table :model_floor_plans do |t|
      t.references :model, index: true, foreign_key: true
      t.references :floor_plan, index: true, foreign_key: true
      t.string :floor_plan_image_id

      t.timestamps null: false
    end
  end
end
