class Amenity < ActiveRecord::Base
  validates :name, presence: true
  # Communities Join Table
  has_many :communities, through: :community_amenities
  has_many :community_amenities, dependent: :destroy
end
