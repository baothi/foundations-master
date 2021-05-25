class Selection < ActiveRecord::Base
  #--- Validations ---#
  validates :name, presence: true
  # validates_length_of :images, minimum: 1, message: "- image required", if: :new_record?

  #--- Associations ---#
  belongs_to :client
  belongs_to :category

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_attachments_for :images, attachment: :file

  def selection_image_url
    images.first.file.try(:cdn_url)
  end
end
