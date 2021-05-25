class AddFileToClientImages < ActiveRecord::Migration
  def change
    add_column :client_images, :file, :string
  end
end
