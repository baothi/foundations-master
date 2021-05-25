class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    @models = Model.all_saved
  end

  # GET /models/1
  # GET /models/1.json
  def show
  end

  # GET /models/new
  def new
    # Force model creation on new, get last unsaved model if exists
    @model = Model.last_unsaved.last || Model.new
    @model.name = Forgery('name').company_name
    @model.save(validate: false)
    @model_image = @model.images.build if @model.images.blank?
    redirect_to edit_model_path(@model)
  end

  # GET /models/1/edit
  def edit
    @model_image = @model.images.build if @model.images.blank?
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)
    respond_to do |format|
      if @model.save
        format.html { redirect_to models_path, notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    model_creation = @model.unsaved?
    respond_to do |format|
      if @model.update(model_params)
        if model_creation
          track(:model_creation, { id: @model.id, name: @model.name })
        else
          track(:model_update, { id: @model.id, name: @model.name, changes: tracked_changes(@model) })
        end
        format.html { redirect_to edit_model_path(@model), notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    track(:model_destruction, { id: @model.id, name: @model.name })
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @model ||= Model.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def model_params
    params.require(:model).permit(
      :name, :code, :square_footage, :description, stage_ids: [], category_ids: [],
      images_attributes: [:id, :file],
      model_elevations_attributes: [:elevation_id, :elevation_image, :cdn_url, :_destroy],
      model_floor_plans_attributes: [:floor_plan_id, :floor_plan_image, :cdn_url, :_destroy]
    )
  end
end
