class Stage < ActiveRecord::Base

  #--- Validations ---#
  validates_presence_of :name, :order
  # validates_length_of :images, minimum: 1, message: "- an image is required for the stage.", :if => :new_record?

  #--- Associations ---#

  # # Images - Not sure if they're needed here
  # as they're added to the ModelStage relationship
  # has_many :images, as: :imageable, dependent: :destroy
  # accepts_attachments_for :images, attachment: :file

  has_many :clients
  has_many :models, through: :model_stages
  has_many :model_stages, dependent: :destroy

  # ClientImages are connected to the client/stage
  has_many :client_images, dependent: :destroy
  has_many :images, through: :client_images
end
