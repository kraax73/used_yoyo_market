require 'test_helper'

class YoyosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yoyos_index_url
    assert_response :success
  end

end
