class ClientImagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_client_image, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:index, :new, :show, :edit, :update, :destroy, :create]

  # GET /client_images
  # GET /client_images.json
  def index
    @client_images = ClientImage.all
    @stages = @client.model.present? ? @client.model.stages : []
    @current_stage = params[:stage_id] ? params[:stage_id].to_i : @stages.first.id
  end

  # GET /client_images/1
  # GET /client_images/1.json
  def show
  end

  # GET /client_images/new
  def new
    @stage_id = params[:stage_id]
    @client_image = ClientImage.new
    respond_to do |format|
      format.js
    end
  end

  # GET /client_images/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /client_images
  # POST /client_images.json
  def create
    msg = ""
    if params[:client_images].present?
      params[:client_images].split(",").each do |image_ur|
        if @client.client_images.where(stage_id: params[:client_image][:stage_id]).count < 10
          params[:client_image][:file] = image_ur
          client_image = @client.client_images.new(client_image_params)
          client_image.save
        else
          msg = "Client has only 10 client images per stage"
          break
        end
      end
    else
      msg = "Please choose the images"
    end

    notice = msg.present? ? msg : "Client images were successfully created."

    if params[:manage_image]
      respond_to do |format|
        format.html { redirect_to client_client_images_path(params[:client_id], stage_id: params[:client_image][:stage_id]), notice: notice }
        # format.json { render :show, status: :created, location: @client_image }
      end
    else
      respond_to do |format|
        format.html { redirect_to redirect_panel_path, notice: notice }
        # format.json { render :show, status: :created, location: @client_image }
      end
    end
  end

  # PATCH/PUT /client_images/1
  # PATCH/PUT /client_images/1.json
  def update
    respond_to do |format|
      if @client_image.update(client_image_params)
        format.html { redirect_to client_client_images_path(params[:client_id]), notice: 'Client image was successfully updated.' }
        # format.json { render :show, status: :ok, location: @client_image }
      else
        format.html { redirect_to client_client_images_path(params[:client_id]), notice: 'Client image was successfully updated.' }
        format.json { render json: @client_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_images/1
  # DELETE /client_images/1.json
  def destroy
    @client_image.destroy
    respond_to do |format|
      format.html { redirect_to client_client_images_path(params[:client_id]), notice: 'Client image was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_image
      @client_image = ClientImage.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

     def redirect_panel_path
      "#{edit_client_path(@client)}#images-panel"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_image_params
      params.require(:client_image).permit(:client_id, :stage_id, :image_category_id, :caption, :file )
    end
end
