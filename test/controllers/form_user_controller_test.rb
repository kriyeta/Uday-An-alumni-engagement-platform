require 'test_helper'

class FormUserControllerTest < ActionController::TestCase
  test "should get user_profile" do
    get :user_profile
    assert_response :success
  end

end
