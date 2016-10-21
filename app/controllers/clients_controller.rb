class ClientsController < ApplicationController
  before_action :authorized_user
  before_action :set_company, only: [:show, :new, :create, :edit, :update]
  before_action :set_client, only: [:show, :edit, :update]

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.company = @company

    respond_to do |format|
      if @client.save
        upload_attachments
        format.html { redirect_to [@company, @client],
          flash: { success: "El cliente ha sido creado exitosamente."}}
        format.js   {}
        format.json {
          render json: @client, status: :created, location: @client
        }
      else
        format.html { render 'new' }
        format.js   {}
        format.json {
          render json: @client.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        upload_attachments
        format.html { redirect_to [@company, @client],
          flash: { success: "El cliente ha sido editado exitosamente."}}
        format.js   {}
        format.json {
          render json: @client, status: :created, location: @client
        }
      else
        format.html { render 'edit' }
        format.js   {}
        format.json {
          render json: @client.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def upload_attachments
    if params[:attachments] and params[:attachments][:file]
      params[:attachments][:file].each do |attachment|
        @client.attachments.create!(file: attachment)
      end
    end
  end

  def client_params
    params.require(:client).permit(:name, :responsible, :description,
      attachments_attributes: [:file])
  end
end
