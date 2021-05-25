class ClientImage < ActiveRecord::Base
  belongs_to :client
  belongs_to :stage

  belongs_to :image_category

  has_uploadcare_file :file

  attr_reader :cdn_url

  def image_url(dimension = nil)
    options = ""
    options = "-/scale_crop/#{dimension}/center/" if dimension.present?
    file ? "#{file.try(:cdn_url)}#{options}" : "//dummyimage.com/#{dimension}/ddd/fff"
  end
end
