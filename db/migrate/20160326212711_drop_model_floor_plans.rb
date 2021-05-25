class DropModelFloorPlans < ActiveRecord::Migration
  def change
    drop_table :model_floor_plans
  end
end
