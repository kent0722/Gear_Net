require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notifications_index_url
    assert_response :success
  end

  test "should get destory" do
    get notifications_destory_url
    assert_response :success
  end
end
