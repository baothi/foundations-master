class UpgradesController < ApplicationController
  before_action :set_upgrade, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:new, :edit, :show, :create, :update]
  # GET /upgrades
  # GET /upgrades.json
  def index
    @upgrades = Upgrade.all
  end

  # GET /upgrades/1
  # GET /upgrades/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /upgrades/new
  def new
    @upgrade = Upgrade.new
    @upgrade_image = @upgrade.images.build if @upgrade.images.blank?
    respond_to do |format|
      format.js
    end
  end

  # GET /upgrades/1/edit
  def edit
    @upgrade_image = @upgrade.images.build if @upgrade.images.blank?
    respond_to do |format|
      format.js
    end
  end

  # POST /upgrades
  # POST /upgrades.json
  def create
    @upgrade = Upgrade.new(upgrade_params)
    @upgrade.client = @client
    respond_to do |format|
      if @upgrade.save
        format.html { redirect_to redirect_panel_path, notice: 'Upgrade was successfully created.' }
        format.json { render :show, status: :created, location: @upgrade }
        format.js
      else
        format.html { render :new }
        format.json { render json: @upgrade.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /upgrades/1
  # PATCH/PUT /upgrades/1.json
  def update
    respond_to do |format|
      if @upgrade.update(upgrade_params)
        format.html { redirect_to redirect_panel_path, notice: 'Upgrade was successfully updated.' }
        format.json { render :show, status: :ok, location: @upgrade }
      else
        format.html { render :edit }
        format.json { render json: @upgrade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upgrades/1
  # DELETE /upgrades/1.json
  def destroy
    @upgrade.destroy
    respond_to do |format|
      format.html { redirect_to upgrades_url, notice: 'Upgrade was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upgrade
      @upgrade = Upgrade.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    def redirect_panel_path
      "#{edit_client_path(@client)}#upgrades-panel"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upgrade_params
      # params.fetch(:upgrade, {})
      params.require(:upgrade).permit(:client_id, :name, :code, :description, :upgrade_images,
                                      :images_attributes => [:id, :file])

    end
end
