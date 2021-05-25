class ClientDocumentsController < ApplicationController
  before_action :set_client_document, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:index, :new, :show, :edit, :update, :destroy]

  def index
    @client_documents = ClientDocument.all
  end

  def show
  end

  def new
    @stage_id = params[:stage_id]
    @client_document = ClientDocument.new
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def create
    @client_document = ClientDocument.new(client_document_params)

    respond_to do |format|
      if @client_document.save
        format.html { redirect_to client_client_documents_path(params[:client_id]), notice: 'Client document was successfully created.' }
        format.json { render :show, status: :created, location: @client_document }
      else
        # format.html { render :new }
        notice = ""
        @client_document.errors.full_messages.each do |msg|
          notice += msg
        end
        format.html { redirect_to client_client_documents_path(params[:client_id]), notice: notice }
        format.json { render json: @client_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client_document.update(client_document_params)
        format.html { redirect_to @client_document, notice: 'Client document was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_document }
      else
        format.html { render :edit }
        format.json { render json: @client_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client_document.destroy
    respond_to do |format|
      format.html { redirect_to client_client_documents_path(params[:client_id]), notice: 'Client document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client_document
    @client_document = ClientDocument.find(params[:id])
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_document_params
    params.require(:client_document).permit(:name, :client_id, :stage_id, :file)
  end
end
