class AlumniController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def update_alumni_personal_info
    mobile = params[:mobile_countryCode].to_s+"-"+params[:mobile].to_s
    dob=nil
    begin
      dob_string=params[:dob_dd].to_s+"-"+params[:dob_mm].to_s+"-"+params[:dob_yyyy].to_s
      dob= Date.strptime(dob_string, '%d-%m-%Y')
    rescue ArgumentError => e
      flash[:error] = e.message
    end
    user = User.where(:id => current_user.id).update_all(:name => params[:name],
                                                         :gender => params[:gender],
                                                         :mobile => mobile,
                                                         :date_of_birth => dob,
                                                         :permanent_address => params[:permanent_address])
    redirect_to '/alumni_schooling_info'
  end

  def update_alumni_schooling_info
    p "@@@@@@@@@@@", params
    user = User.where(:id => current_user.id).update_all(:passout_school => params[:passout_school],
                                                         :passout_class => params[:passout_class],
                                                         :passout_year => params[:passout_year])
    redirect_to '/alumni_current_location_n_occupation_info'
  end

  def update_alumni_current_location_n_occupation_info
    p "@@@@@@@@@@@", params
    user = User.where(:id => current_user.id).update_all(:current_address => params[:current_address],
                                                         :current_city => params[:current_address_city],
                                                         :current_country => params[:current_address_country],
                                                         :current_occupation_status => params[:what_do_you_do],
                                                         :current_occupation_status_details => params[:what_do_you_do_details])
    redirect_to '/my_profile'
    flash[:notice] = 'Successfully Updated Your Profile.'
  end

end
