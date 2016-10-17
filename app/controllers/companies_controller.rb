class CompaniesController < ApplicationController
  before_action :authorized_user

  def index
    @companies = Company.all
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
end
