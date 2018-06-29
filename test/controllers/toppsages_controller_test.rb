require 'test_helper'

class ToppsagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get toppsages_index_url
    assert_response :success
  end

end
