class AddImageCategoryIdToClientImages < ActiveRecord::Migration
  def change
    add_column :client_images, :image_category_id, :integer, after: :stage_id
  end
end
