require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
    assert_select "h1", "アカウント作成"
    # assert_template '/users/new' 使えなかった
  end

  test "valid signup information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name:  "test1",
                                         email: "test@gmail.com",
                                         password:              "foobar",
                                         password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_select "h1", "ユーザー表示"
  end
end
