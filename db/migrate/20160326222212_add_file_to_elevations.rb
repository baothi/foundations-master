class AddFileToElevations < ActiveRecord::Migration
  def change
    add_column :elevations, :file, :string
  end
end
