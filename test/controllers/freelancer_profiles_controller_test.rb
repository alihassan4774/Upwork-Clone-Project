require "test_helper"

class FreelancerProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get freelancer_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get freelancer_profiles_create_url
    assert_response :success
  end

  test "should get show" do
    get freelancer_profiles_show_url
    assert_response :success
  end

  test "should get edit" do
    get freelancer_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get freelancer_profiles_update_url
    assert_response :success
  end
end
