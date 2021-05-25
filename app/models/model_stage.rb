class ModelStage < ActiveRecord::Base
  belongs_to :model
  belongs_to :stage
  # attachment :stage_image
  # has_uploadcare_file :stage_image

  # def stage_image_url
  #   stage_image.try(:cdn_url)
  # end
end

