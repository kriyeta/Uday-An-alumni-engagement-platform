module AlumniHelper
  def update_button_code
    "<a class='btn btn-primary' href='/alumni_personal_info' role='button'>UPDATE YOUR PROFILE</a>".html_safe
  end

  def update_link
    "<a style='text-decoration:none;color:white;' href='/alumni_personal_info'><font size='4'>Edit</font></a>".html_safe
  end

  def my_profile
    "<a style='text-decoration:none;color:white;' href='/my_profile'><font size='4'>My Profile</font></a>".html_safe
  end
end
