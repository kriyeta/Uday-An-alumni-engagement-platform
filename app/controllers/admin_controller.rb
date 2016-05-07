class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user_as_admin!

  def admin
  end
end
