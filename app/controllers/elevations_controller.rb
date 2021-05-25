class ElevationsController < ApplicationController
  before_action :set_elevation, only: [:show, :edit, :update, :destroy]
  before_action :set_client

  def index
    @elevations = Elevation.all
  end

  def show
  end

  def new
    @panel_title = "Add New Elevation"
    @elevation = Elevation.new
  end

  def edit
    @panel_title = "Edit Elevation"
  end

  def create
    @elevation = Elevation.new(elevation_params)

    respond_to do |format|
      if @elevation.save
        format.html { redirect_to client_elevations_path(@client), notice: 'Elevation was successfully created.' }
        format.json { render :show, status: :created, location: @elevation }
      else
        format.html { render :new }
        format.json { render json: @elevation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @elevation.update(elevation_params)
        format.html { redirect_to client_elevations_path(@client), notice: 'Elevation was successfully updated.' }
        format.json { render :show, status: :ok, location: @elevation }
      else
        format.html { render :edit }
        format.json { render json: @elevation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @elevation.destroy
    respond_to do |format|
      format.html { redirect_to client_elevations_path(@client), notice: 'Elevation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elevation
      @elevation = Elevation.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elevation_params
      params.require(:elevation).permit(:name, :description, :client_id, :file)
    end
end
