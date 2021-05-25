class AddClientToFloorPlans < ActiveRecord::Migration
  def change
    add_reference :floor_plans, :client, index: true
  end
end
