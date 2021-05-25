class AddElevationImageToModelElevations < ActiveRecord::Migration
  def change
    add_column :model_elevations, :elevation_image, :string
  end
end
