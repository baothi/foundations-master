class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :update_remote]

  def index
    @clients = Client.with_model_and_stage
  end

  def show
  end

  def new
    # Force client creation on new, get last unsaved client if exists
    @client = Client.last_unsaved.last || Client.new
    @client.email = Forgery(:internet).email_address
    @client.save(validate: false)
    redirect_to edit_client_path(@client)
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.password = Forgery(:basic).password
    respond_to do |format|
      if @client.save
        format.html { redirect_to edit_client_path(@client), notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    client_creation = @client.unsaved?
    respond_to do |format|
      if @client.update(client_params)
        if client_creation
          track(:client_creation, { id: @client.id, full_name: @client.decorate.full_name })
        else
          track(:client_update, { id: @client.id, full_name: @client.decorate.full_name, changes: tracked_changes(@client) })
        end
        format.html { redirect_to edit_client_path(@client), notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_remote
    @client.assign_attributes(client_params)
    @client.closing_date = @client.closing_date.to_date
    respond_to do |format|
      if @client.save(validate: false)
        format.json { render json: client_params }
      else
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    track(:client_destruction, { id: @client.id, full_name: @client.decorate.full_name })
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_stage_select
    @model = Model.find(params['model_id'])
    @model_id = params['model_id']
    @stages = @model.stages
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      # params.fetch(:client, {})
      params.require(:client).permit(
        :first_name, :last_name, :email, :phone, :mobile, :community_id, :model_id,
        :stage_id, :lot, :closing_date, :account_number
      )
    end
end
