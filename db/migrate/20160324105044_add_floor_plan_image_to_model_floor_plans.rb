class AddFloorPlanImageToModelFloorPlans < ActiveRecord::Migration
  def change
    add_column :model_floor_plans, :floor_plan_image, :string
  end
end
