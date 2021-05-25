class AddStageImageToModelStages < ActiveRecord::Migration
  def change
    add_column :model_stages, :stage_image, :string
  end
end
