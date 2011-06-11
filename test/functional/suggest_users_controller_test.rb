require 'test_helper'

class SuggestUsersControllerTest < ActionController::TestCase
  test "should get guess" do
    get :guess
    assert_response :success
  end

end
