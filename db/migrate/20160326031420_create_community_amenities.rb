class CreateCommunityAmenities < ActiveRecord::Migration
  def change
    create_table :community_amenities do |t|
      t.integer :community_id
      t.integer :amenity_id

      t.timestamps null: false
    end
  end
end
