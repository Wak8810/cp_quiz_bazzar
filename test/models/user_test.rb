require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                      password: "foobarbaz", password_confirmation:"foobarbaz")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be invalid because name is blank" do
    @user.name = " " * 10
    assert_not @user.valid?
  end

  test "should be invalid because email is wrong" do
    @user.email = "aaa"
    assert_not @user.valid?
  end

  test "should be invalid because password is too short" do
    @user.password = @user.password_confirmation = "aaa"
    assert_not @user.valid?
  end

  test "should be invalid because password is brank" do
    @user.password = @user.password_confirmation = " " * 10
    assert_not @user.valid?
  end
end
