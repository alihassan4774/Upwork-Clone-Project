require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy_account" do
    get users_destroy_account_url
    assert_response :success
  end
end
