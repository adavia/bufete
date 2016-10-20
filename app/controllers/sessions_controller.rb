class SessionsController < ApplicationController
  before_action :is_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or companies_url
    else
      flash.now[:danger] = "Sus credenciales no son válidas. Intente nuevamente."
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url,
      flash: { success: "Hasta luego!" }
  end

  private

  def is_logged_in
    if logged_in?
      redirect_to companies_url
    end
  end
end
