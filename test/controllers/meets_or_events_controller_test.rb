require 'test_helper'

class MeetsOrEventsControllerTest < ActionController::TestCase
  test "should get upcoming_events" do
    get :upcoming_events
    assert_response :success
  end

  test "should get all_events" do
    get :all_events
    assert_response :success
  end

  test "should get agendas" do
    get :agendas
    assert_response :success
  end

end
