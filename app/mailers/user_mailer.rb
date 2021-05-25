class UserMailer < ApplicationMailer
  # before_filter :set_host_from_request, only: [:create]
  def password_reset(user)
    byebug
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  private
    def set_host_from_request
      ActionMailer::Base.default_url_options = { host: request.host_with_port }
    end

end
