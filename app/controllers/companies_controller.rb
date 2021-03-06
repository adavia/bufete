class CompaniesController < ApplicationController
  before_action :authorized_user
  before_action :set_company, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @company,
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

  def edit
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company,
          flash: { success: "La empresa ha sido editada exitosamente."}}
        format.js   {}
        format.json {
          render json: @company, status: :created, location: @company
        }
      else
        format.html { render 'edit' }
        format.js   {}
        format.json {
          render json: @company.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url,
          flash: { success: "La empresa ha sido eliminada exitosamente."}}
      format.js {}
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
