require 'test_helper'

class ReceivedGiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get received_gifts_index_url
    assert_response :success
  end

end
