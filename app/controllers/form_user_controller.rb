class FormUserController < ApplicationController
  def user_profile
    @user_profile  = FormUser.find(params[:id] )
  end
end
