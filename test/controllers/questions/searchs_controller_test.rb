require 'test_helper'

class Questions::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get questions_searchs_search_url
    assert_response :success
  end

end
