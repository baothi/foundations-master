class Model < ActiveRecord::Base
  has_paper_trail

  #--- Validations ---#
  validates_presence_of :name, :square_footage, :description
  validates_length_of :categories, minimum: 1, message: "- select at least one Category"
  # validates_length_of :stages, minimum: 1, message: "- select as least one Stage"

  # validates_length_of :elevations, minimum: 2, message: "- choose at least 2 Elevation images"
  # validates_length_of :floor_plans, minimum: 2, message: "- choose at least 2 Floor Plan images"

  #--- Scopes ---#
  scope :all_saved, -> { where.not(square_footage: nil) }
  scope :last_unsaved, -> { where({square_footage: nil}) }

  #--- Associations ---#
  has_many :clients

  # Image References
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_attachments_for :images, attachment: :file

  # ModelStage Join Table - With stage_image attachment
  # NOTES
  # Grabbing model/stage images:
  # Model.second.model_stages.first.stage_image
  has_many :stages, through: :model_stages
  has_many :model_stages, dependent: :destroy
  accepts_nested_attributes_for :model_stages, allow_destroy: true
  # accepts_attachments_for :model_stages, attachment: :stage_image

  # Categories Join Table
  has_many :categories, through: :model_categories
  has_many :model_categories, dependent: :destroy

  after_validation :reset_messages

  def unsaved?
    square_footage.blank?
  end

  def current_image_url
    images.first.file.try(:cdn_url)
  end

  def reset_messages
    if errors["images.file"].present?
      errors.delete :"images.file"
      errors["model.image"] = "can't be blank"
    end
  end
end
