class Users::InvitationsController < Devise::InvitationsController
  layout "auth", :except => [:create]

  def create

    @user = User.invite!(invitation_params, current_user) do |u|
      u.skip_invitation = false
    end

    @user.add_role(params[:user][:role])

    if @user.errors.empty?
      track(:user_creation, { id: @user.id, full_name: @user.decorate.full_name, email: @user.email })
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render "users/new"
    end
  end

private

  def invitation_params
    {
      first_name: params[:user][:first_name],
      last_name:  params[:user][:last_name],
      email:      params[:user][:email]
    }
  end
end
