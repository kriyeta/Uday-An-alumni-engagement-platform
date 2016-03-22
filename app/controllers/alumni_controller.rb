class AlumniController < ApplicationController
  
  before_action :authenticate_user!
  def update_alumni_information
    p "@@@@@@@@@@@", params
  end
  
  def alumni_personal_info_form
  end

  def my_profile
  end
end
