class ClientDocument < ActiveRecord::Base
  belongs_to :client
  belongs_to :stage

  has_uploadcare_file :file
end
