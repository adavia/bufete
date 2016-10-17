class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  protected

  # Confirms a logged-in user.
  def authorized_user
    unless logged_in?
      store_location
      redirect_to root_url
      flash[:info] = "Debe iniciar sesión para poder acceder al sistema."
    end
  end
end
