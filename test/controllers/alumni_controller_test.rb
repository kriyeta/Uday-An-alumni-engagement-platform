require 'test_helper'

class AlumniControllerTest < ActionController::TestCase
  test "should get update_alumni_information" do
    get :update_alumni_information
    assert_response :success
  end

end
