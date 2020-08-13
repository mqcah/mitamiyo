require 'test_helper'

class Customer::MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_movie_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_movie_show_url
    assert_response :success
  end

  test "should get new" do
    get customer_movie_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_movie_edit_url
    assert_response :success
  end

end
