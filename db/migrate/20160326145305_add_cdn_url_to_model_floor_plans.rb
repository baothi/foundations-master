class AddCdnUrlToModelFloorPlans < ActiveRecord::Migration
  def change
    add_column :model_floor_plans, :cdn_url, :string
  end
end
