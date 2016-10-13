class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or root_url
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
end
