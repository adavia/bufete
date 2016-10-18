class CompaniesController < ApplicationController
  before_action :authorized_user
  before_action :set_company, only: :show

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_url,
          flash: { success: "La empresa ha sido creada exitosamente."}}
        format.json { render json: @company,
          status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors,
          status: :unprocessable_entity }
      end
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
