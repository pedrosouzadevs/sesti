require "test_helper"

class HelmetsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get helmets_show_url
    assert_response :success
  end
end
