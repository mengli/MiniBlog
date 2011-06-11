require 'test_helper'

class MessageQueueControllerTest < ActionController::TestCase
  test "should get fetch_msg" do
    get :fetch_msg
    assert_response :success
  end

end
