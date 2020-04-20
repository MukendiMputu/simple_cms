require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get sessions_signin_url
    assert_response :success
  end

  test "should get show" do
    get sessions_show_url
    assert_response :success
  end

  test "should get edit" do
    get sessions_edit_url
    assert_response :success
  end

  test "should get signout" do
    get sessions_signout_url
    assert_response :success
  end

end
