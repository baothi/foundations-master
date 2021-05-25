class User < ActiveRecord::Base
  has_paper_trail
  attr_accessor :role

  default_scope { where("users.type is null") }

  #--- Constants ---#
  # Roles: :admin, :owner, :manager, :staff, :client
  ALL_ROLES = [ :staff, :admin, :owner, :manager,  :client]
  DASHBOARD_USER_ROLES = [ :staff, :manager, :admin ]
  serialize :role_ids
  # Categories Join Table
  # has_many :roles, through: :user_roles
  # has_many :user_roles, dependent: :destroy
  # accepts_nested_attributes_for :user_roles, allow_destroy: true

  rolify
  attr_reader :raw_invitation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invite_for => 2.weeks
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates_presence_of :email

  #--- Associations ---#


  #--- Scopes ---#
  scope :clients, -> { with_role(:client).where.not(id: User.with_any_role(:admin, :owner, :manager, :staff)) }

  def assign_roles(roles)
    roles.each { |role| add_role(role) }
  end

  def current_role
    roles.first.try(:name)
  end

  def change_role(role)
    self.roles.destroy_all
    self.add_role(role.to_sym)
  end

  def admin?
    has_role? :admin
  end

  def manager?
    has_role? :manager
  end

  def staff?
    has_role? :staff
  end
end
