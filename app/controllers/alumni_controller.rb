class AlumniController < ApplicationController
  
  before_action :authenticate_user!
  def update_alumni_information
    p "@@@@@@@@@@@", params
  end
  
  def show_alumni_information_form
  end
end
