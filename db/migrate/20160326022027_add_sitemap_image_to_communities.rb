class AddSitemapImageToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :sitemap_image, :string
  end
end
