require "test_helper"

class Api::ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_chat_create_url
    assert_response :success
  end
end
