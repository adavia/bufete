class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  # Confirms a logged-in user.
  def authorized_user
    unless logged_in?
      store_location
      redirect_to root_url
      flash[:info] = "You must be logged in to access."
    end
  end
end
