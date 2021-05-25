class FloorPlansController < ApplicationController
  before_action :set_floor_plan, only: [:show, :edit, :update, :destroy]
  before_action :set_client

  def index
    @floor_plans = FloorPlan.all
  end

  def show
  end

  def new
    @panel_title = "Add New Floor Plan"
    @floor_plan = FloorPlan.new
  end

  def edit
    @panel_title = "Edit Floor Plan"
  end

  def create
    @floor_plan = FloorPlan.new(floor_plan_params)

    respond_to do |format|
      if @floor_plan.save
        format.html { redirect_to client_floor_plans_path(@client), notice: 'Floor plan was successfully created.' }
        format.json { render :show, status: :created, location: @floor_plan }
      else
        format.html { render :new }
        format.json { render json: @floor_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @floor_plan.update(floor_plan_params)
        format.html { redirect_to client_floor_plans_path(@client), notice: 'Floor plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @floor_plan }
      else
        format.html { render :edit }
        format.json { render json: @floor_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @floor_plan.destroy
    respond_to do |format|
      format.html { redirect_to client_floor_plans_path(@client), notice: 'Floor plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floor_plan
      @floor_plan = FloorPlan.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floor_plan_params
      params.require(:floor_plan).permit(:name, :description, :client_id, :file)
    end
end
