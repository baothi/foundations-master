class Activity < ActiveRecord::Base
  include ActivityManagement

  class MissingActivityType < StandardError; end

  default_scope { order("activities.created_at desc") }

  belongs_to :performer, class_name: "User"

  validates :performer_id, presence: true

  validate :required_details_must_be_defined

  def self.require_details(*required_details_list)
    define_method :required_details do
      required_details_list
    end
  end

  def self.class_for_type(type)
    type = type.to_s

    "ActivityType::#{type.camelize}".safe_constantize || raise_missing_type_error(type)
  end

  def required_details
    []
  end

  private

  def self.raise_missing_type_error(type)
    raise MissingActivityType.new("Cannot find ActivityType \"#{type}\". Be sure to define class \"#{type.classify}\" at app/models/activity_type/#{type}.rb")
  end

  def required_details_must_be_defined
    missing_keys = required_details.map(&:to_s) - (details || {}).keys.map(&:to_s)

    if missing_keys.any?
      errors.add(:details, "missing required details: #{missing_keys.join(', ')}")
    end
  end
end
