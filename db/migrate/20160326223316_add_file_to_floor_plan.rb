class AddFileToFloorPlan < ActiveRecord::Migration
  def change
    add_column :floor_plans, :file, :string
  end
end
