class Client < User
  has_paper_trail
  self.default_scopes = []

  #--- Validations ---#
  validates :first_name, :last_name, :phone, presence: true
  validates_presence_of :community, :model, :stage

  #--- Scopes ---#
  default_scope { with_role(:client).where.not(id: User.with_any_role(:admin, :owner, :manager, :staff)) }
  scope :with_model_and_stage, -> { joins(:model).joins(:stage) }
  scope :all_saved, -> { where("first_name is not null and last_name is not null") }
  scope :last_unsaved, -> { where({first_name: nil, last_name: nil}) }

  #--- Associations ---#
  belongs_to :model
  belongs_to :stage
  belongs_to :community, inverse_of: :clients

  has_many :selections, dependent: :destroy
  has_many :upgrades, dependent: :destroy
  has_many :elevations, dependent: :destroy
  has_many :floor_plans, dependent: :destroy

  has_many :client_images, dependent: :destroy
  has_many :images, through: :client_images
  after_create :assign_default_role

  def unsaved?
    first_name.blank? && last_name.blank?
  end

  def assign_default_role
    add_role(:client) if self.roles.blank?
  end
end
