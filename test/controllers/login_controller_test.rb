require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_new_url
    assert_response :success
  end

  test "should get show" do
    get login_show_url
    assert_response :success
  end

  test "should get delete" do
    get login_delete_url
    assert_response :success
  end

end
