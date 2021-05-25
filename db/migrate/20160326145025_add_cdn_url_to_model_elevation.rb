class AddCdnUrlToModelElevation < ActiveRecord::Migration
  def change
    add_column :model_elevations, :cdn_url, :string
  end
end
