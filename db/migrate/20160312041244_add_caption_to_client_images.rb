class AddCaptionToClientImages < ActiveRecord::Migration
  def change
    add_column :client_images, :caption, :string
  end
end
