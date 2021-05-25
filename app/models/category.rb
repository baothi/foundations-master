class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :models, through: :model_categories
  has_many :model_categories, dependent: :destroy

  has_many :selections
end
