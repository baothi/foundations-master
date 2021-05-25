module OptionsSelectHelper

  def user_role_options
    if current_user.admin?
      User::DASHBOARD_USER_ROLES.collect {|r| [ r.capitalize, r ] }
    elsif current_user.manager?
      (User::DASHBOARD_USER_ROLES - [:admin, :manager]).collect {|r| [ r.capitalize, r ] }
    else
      []
    end
  end
end
