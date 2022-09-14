require 'test_helper'

class RecommendGiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recommend_gifts_index_url
    assert_response :success
  end

end
