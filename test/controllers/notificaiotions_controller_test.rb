require "test_helper"

class NotificaiotionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notificaiotions_index_url
    assert_response :success
  end

  test "should get destory" do
    get notificaiotions_destory_url
    assert_response :success
  end
end
