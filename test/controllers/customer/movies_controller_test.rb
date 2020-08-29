require 'test_helper'

class Customer::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_movies_new_url
    assert_response :success
  end

end
