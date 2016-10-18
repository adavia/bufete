class ClientsController < ApplicationController
  before_action :authorized_user
  before_action :set_company, only: [:show, :create]
  before_action :set_client, only: :show

  def show
  end

  def new
  end

  def create
    @client = @company.clients.build(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @company,
          flash: { success: "El cliente ha sido creado exitosamente."}}
        format.js   {}
        format.json {
          render json: @client, status: :created, location: @client
        }
      else
        format.html { render 'companies/show' }
        format.js   {}
        format.json {
          render json: @client.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :responsible, :description)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
