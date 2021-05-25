class DashboardController < ApplicationController
  def index
    @recent_activities = Activity.limit(5)
  end
end
