class FloorPlan < ActiveRecord::Base
  attr_reader :cdn_url

  validates_presence_of :name
  has_uploadcare_file :file

  belongs_to :client

end
