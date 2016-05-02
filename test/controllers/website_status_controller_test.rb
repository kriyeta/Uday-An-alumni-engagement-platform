require 'test_helper'

class WebsiteStatusControllerTest < ActionController::TestCase
  test "should get under_construction" do
    get :under_construction
    assert_response :success
  end

  test "should get under_maintenance" do
    get :under_maintenance
    assert_response :success
  end

end
