class EmployeesController < ApplicationController
  before_action :authorized_user
  before_action :set_client, only: [:show, :new, :create, :edit, :update]
  before_action :set_employee, only: [:show, :edit, :update]

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.client = @client

    respond_to do |format|
      if @employee.save
        upload_attachments
        format.html { redirect_to [@client.company, @client],
          flash: { success: "El expediente ha sido creado exitosamente."}}
        format.js   {}
        format.json {
          render json: @employee, status: :created, location: @employee
        }
      else
        format.html { render 'new' }
        format.js   {}
        format.json {
          render json: @employee.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        upload_attachments
        format.html { redirect_to [@client.company, @client],
          flash: { success: "El expediente ha sido editado exitosamente."}}
        format.js   {}
        format.json {
          render json: @employee, status: :created, location: @employee
        }
      else
        format.html { render 'edit' }
        format.js   {}
        format.json {
          render json: @employee.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

  def upload_attachments
    if params[:attachments] and params[:attachments][:file]
      params[:attachments][:file].each do |attachment|
        @employee.attachments.create!(file: attachment)
      end
    end
  end

  def employee_params
    params.require(:employee).permit(:name, :last_name, :ife,
      attachments_attributes: [:file])
  end
end
