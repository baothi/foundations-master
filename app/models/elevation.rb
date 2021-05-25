class Elevation < ActiveRecord::Base
  attr_reader :cdn_url
  has_uploadcare_file :file

  validates_presence_of :name
  belongs_to :client
end
