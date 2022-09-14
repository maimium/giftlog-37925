require 'test_helper'

class GaveGiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gave_gifts_index_url
    assert_response :success
  end

end
