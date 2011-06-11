require 'test_helper'

class UploadPicControllerControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

end
