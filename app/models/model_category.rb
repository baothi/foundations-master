class ModelCategory < ActiveRecord::Base
  belongs_to :model
  belongs_to :category
end
