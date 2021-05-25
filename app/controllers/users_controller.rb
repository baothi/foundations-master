class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :update_role]

  def index
    authorize User
    @users = policy_scope(User.where.not(id: current_user.id))
  end

  def new
    @panel_title = "New User"
    @user = User.new
    authorize User
  end

  def edit
    authorize @user
    @panel_title = "Edit User"
  end

  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        @user.change_role(params[:user][:role])
        track(:user_update, { id: @user.id, full_name: @user.decorate.full_name, email: @user.email, changes: tracked_changes(@user) })
        format.html { redirect_to users_path, notice: 'Updated user successfully' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @user
    @user.roles.destroy
    @user.destroy
    track(:user_destruction, { id: @user.id, full_name: @user.decorate.full_name, email: @user.email })
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Removed user successfully' }
      format.json { head :no_content }
    end
  end

  def update_role
    authorize @user, :update?
    @user.change_role(params[:role])
    track(:user_update, { id: @user.id, full_name: @user.decorate.full_name, email: @user.email, changes: tracked_changes(@user) })
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user ||= User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end
end

