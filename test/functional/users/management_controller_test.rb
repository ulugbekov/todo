require 'test_helper'

class Users::ManagementControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
