require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get pages_landing_url
    assert_response :success
  end

  test "should get client" do
    get pages_client_url
    assert_response :success
  end

  test "should get freelancer" do
    get pages_freelancer_url
    assert_response :success
  end
end
