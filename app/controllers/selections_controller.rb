class SelectionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :set_selection, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:new, :edit, :show, :create, :update]

  # GET /selections
  # GET /selections.json
  def index
    @selections = Selection.all
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /selections/new
  def new
    @selection = Selection.new
    @selection_image = @selection.images.build if @selection.images.blank?
    respond_to do |format|
      format.js
    end
  end

  # GET /selections/1/edit
  def edit
    @selection_image = @selection.images.build if @selection.images.blank?
    respond_to do |format|
      format.js
    end
  end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(selection_params)
    @selection.client = @client
    respond_to do |format|
      if @selection.save
        format.html { redirect_to redirect_panel_path, notice: 'Selection was successfully created.' }
        format.json { render :show, status: :created, location: @selection }
        format.js
      else
        format.html { redirect_to redirect_panel_path, @selection.errors }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /selections/1
  # PATCH/PUT /selections/1.json
  def update
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to redirect_panel_path, notice: 'Selection was successfully updated.' }
        format.json { render :show, status: :ok, location: @selection }
      else
        format.html { render :edit }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to selections_url, notice: 'Selection was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    def redirect_panel_path
      "#{edit_client_path(@client)}#selections-panel"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_params
      # params.fetch(:selection, {})
      params.require(:selection).permit(:client_id, :category_id, :name, :code, :description,
                                        :images_attributes => [:id, :file])

    end
end
