require "test_helper"

class DancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dances_index_url
    assert_response :success
  end

  test "should get show" do
    get dances_show_url
    assert_response :success
  end
end
