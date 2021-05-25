module ActivityManagement
  extend ActiveSupport::Concern

  def self.included(base)
    base.extend(ClassMethods)
  end

  # Class Methods
  module ClassMethods
    def dashboard_feeds
      where("type in ('ActivityType::InvestmentCreation', 'ActivityType::InvestmentUpdate')")
    end
  end

  # Instance Methods
end