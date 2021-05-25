class ImageCategoriesController < ApplicationController
  before_action :set_image_category, only: [:show, :edit, :update, :destroy]

  # GET /image_categories
  # GET /image_categories.json
  def index
    @image_categories = ImageCategory.all
  end

  # GET /image_categories/1
  # GET /image_categories/1.json
  def show
  end

  # GET /image_categories/new
  def new
    @panel_title = "New Image Category"
    @image_category = ImageCategory.new
  end

  # GET /image_categories/1/edit
  def edit
    @panel_title = "Edit Image Category"
  end

  # POST /image_categories
  # POST /image_categories.json
  def create
    @image_category = ImageCategory.new(image_category_params)

    respond_to do |format|
      if @image_category.save
        format.html { redirect_to image_categories_path, notice: 'Image category was successfully created.' }
        format.json { render :show, status: :created, location: @image_category }
      else
        format.html { render :new }
        format.json { render json: @image_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_categories/1
  # PATCH/PUT /image_categories/1.json
  def update
    respond_to do |format|
      if @image_category.update(image_category_params)
        format.html { redirect_to image_categories_path, notice: 'Image category was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_category }
      else
        format.html { render :edit }
        format.json { render json: @image_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_categories/1
  # DELETE /image_categories/1.json
  def destroy
    @image_category.destroy
    respond_to do |format|
      format.html { redirect_to image_categories_url, notice: 'Image category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_category
      @image_category = ImageCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_category_params
      params.require(:image_category).permit(:image_id, :name, :description)
    end
end
