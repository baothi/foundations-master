class Image < ActiveRecord::Base
  attr_reader :cdn_url

  # attachment :file, type: :image
  belongs_to :imageable, polymorphic: true
  has_uploadcare_file :file
end
