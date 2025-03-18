require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testone)
  end

  test "login with invalid information" do
    get login_path
    assert_select "h1", "ログイン"
    post login_path, params: { session: { email: "", password: "" } }
    assert_not is_logged_in?
    assert_response :unprocessable_entity
  end

  test "login with invalid information valid email/invalid password" do
    get login_path
    assert_select "h1", "ログイン"
    post login_path, params: { session: { email: @user.email, password: "" } }
    assert_not is_logged_in?
    assert_response :unprocessable_entity
  end

  test "login with valid information and logout" do
    post login_path, params: { session: { email: @user.email, password: "password" } }
    assert_redirected_to @user
    follow_redirect!
    assert_select "h1", "ユーザー表示"
    assert is_logged_in?
    delete logout_path
    assert_not is_logged_in?
    assert_response :see_other
    assert_redirected_to root_url
    follow_redirect!
    assert_select "h1", "ログイン"
  end
end
