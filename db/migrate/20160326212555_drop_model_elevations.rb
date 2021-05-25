class DropModelElevations < ActiveRecord::Migration
  def change
    drop_table :model_elevations
  end
end
