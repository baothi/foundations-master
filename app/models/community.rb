class Community < ActiveRecord::Base
  has_paper_trail

  # Validations
  validates :name, :description, :address, :city, :province, :postal_code, presence: true
  validates_length_of :images, minimum: 1, message: "- an image is required for community."

  # Associations
  has_many :clients, inverse_of: :community

  # Amenities Join Table
  has_many :amenities, through: :community_amenities
  has_many :community_amenities, dependent: :destroy

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_attachments_for :images, attachment: :file

  before_destroy :reset_client_communities

  def current_image_url
    images.first.file.try(:cdn_url)
  end


private

  def reset_client_communities
    self.clients.update_all({community_id: nil})
  end

end
