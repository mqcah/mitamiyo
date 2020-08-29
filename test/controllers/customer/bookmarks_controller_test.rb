require 'test_helper'

class Customer::BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customer_bookmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_bookmarks_destroy_url
    assert_response :success
  end

end
