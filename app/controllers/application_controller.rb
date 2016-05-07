class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info
  before_action :authenticate_user!

  def website_status
  end

  def admin
  end

  protected
  def authorize_user_as_admin!
    redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_user.admin
  end
end
