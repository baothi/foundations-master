class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def track(activity_type, details = {})
    activity_tracker.track(activity_type, details)
  end

  def tracked_changes(record)
    PreviousRecordVersionChangeset.new(record).changeset
  end

  def activity_tracker
    @activity_tracker ||= ActivityTracker.new(user: current_user, user_ip_address: request.remote_ip)
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end