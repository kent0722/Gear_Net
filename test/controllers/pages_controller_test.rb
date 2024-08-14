require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Terms_of_use" do
    get pages_Terms_of_use_url
    assert_response :success
  end

  test "should get policy" do
    get pages_policy_url
    assert_response :success
  end

  test "should get privacy" do
    get pages_privacy_url
    assert_response :success
  end
end
