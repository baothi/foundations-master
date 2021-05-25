class CommunityAmenity < ActiveRecord::Base
  belongs_to :community
  belongs_to :amenity
end
