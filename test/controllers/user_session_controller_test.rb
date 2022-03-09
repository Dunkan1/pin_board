require 'test_helper'

class User::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should sign in" do
    # It is searching for that fixture
    @user = users(:user_vic)

    sign_in(@user)
    post user_session_url
    assert_redirected_to root_url
  end
end