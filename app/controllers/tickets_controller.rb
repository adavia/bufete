class TicketsController < ApplicationController
  before_action :authorized_user
  before_action :set_employee, only: [:show, :create, :edit, :update]
  before_action :set_ticket, only: [:show, :edit, :update]

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.employee = @employee
    @ticket.user = current_user

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to [@employee.client, @employee],
          flash: { success: "El ticket ha sido creado exitosamente."}}
        format.js   {}
        format.json {
          render json: @ticket, status: :created, location: @ticket
        }
      else
        format.html { render 'employees/show' }
        format.js   {}
        format.json {
          render json: @ticket.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @employee.update(ticket_params)
        format.html { redirect_to [@client.company, @client],
          flash: { success: "El ticket ha sido editado exitosamente."}}
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
    @employee = Employee.find(params[:employee_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end
end
