class ImageCategory < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :image
end
