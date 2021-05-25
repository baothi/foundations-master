class ActivityTracker

  def initialize(user:, user_ip_address:)
    @user            = user
    @user_ip_address = user_ip_address
  end

  def track(type, details={})
    activity_class_for_type(type).create(performer: user, details: details.merge(default_activity_details))
  end

  private

  attr_reader :user, :user_ip_address

  def activity_class_for_type(activity_type)
    Activity.class_for_type(activity_type)
  end

  def default_activity_details
    {
        ip_address: user_ip_address
    }
  end

end
