require 'test_helper'

class FetchProfileControllerTest < ActionController::TestCase
  test "should get fetch_profile" do
    get :fetch_profile
    assert_response :success
  end

end
