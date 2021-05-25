class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  before_filter :configure_permitted_parameters
  layout 'auth'
  # GET /resource/sign_in
  # def new
  #   super
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:login, :password) }
  end
  # POST /resource/sign_in
  def create
    # super
    self.resource = warden.authenticate!(auth_options)
    welcome_setting = Setting.find_by(key: "general_settings/welcome_message")
    if welcome_setting.present? && welcome_setting.value.present?
      flash[:success] = welcome_setting.value
    else
      set_flash_message(:notice, :signed_in) if is_flashing_format?
    end
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
