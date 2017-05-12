require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # several test at the beggining we wrote to understand
  # how rails5 handle test-database
  test "test_setup_fixture_users" do
    assert_equal(1, User.all.count)

    userExist = User.find_by(email: 'foo@bar.no')
    userNotExist = User.find_by(email: 'r')

    assert_not userExist.nil?
    assert userNotExist.nil?
    assert_equal(1, User.all.count)
    assert_equal("foo@bar.no", userExist.email)
    assert_equal("foo@bar.no", users(:user1).email)
  end

  test "test_user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
  end

  test "test_user_email_not_match_reg_expression" do
    user = User.new(email: "asd", password: "123456")

    # Assert
    assert user.invalid?
    assert_equal ["is invalid"],
                 user.errors[:email]
    assert !user.errors[:password].any?
  end

  test "user_password_not_long_enough" do
    # Arrange
    user = User.new(email: "han@solo.no", password: "12345")

    # Assert
    assert user.invalid?
    assert !user.errors[:email].any?
    assert user.errors[:password].any?
    assert_equal ["is too short (minimum is 6 characters)"],
                 user.errors[:password]
  end

  test "test_create_save_valid_user" do
    # Arrange
    emailValid = "ruby@mess.no"
    passwordValid = "password"
    user = User.new(email: emailValid.to_s, password: passwordValid.to_s)

    # Assert
    assert user.valid?, "User data must be valid"
    assert user.save
    assert_equal(2, User.all.count)
    # just to understand is db clean after each test
    assert_not_equal(3, User.all.count)
  end

  test "test_create_save_not_valid_users" do
    # Arrange
    emailValid = "ruby@mess.no"
    passwordValid = "password"
    user1 = User.new(email: "not", password: passwordValid.to_s)
    user2 = User.new(email: emailValid.to_s, password: "not")
    user3 = User.new(email:  "not", password:  "not")

    # Assert
    assert_not user1.valid?, "User data must be valid"
    assert_not user2.valid?, "User data must be valid"
    assert_not user3.valid?, "User data must be valid"
    assert !user1.save
    assert !user2.save
    assert !user3.save
    assert_equal(1, User.all.count)
  end

  test "test_save_valid_user_twice" do
    # Arrange
    passwordValid = "password"
    user = User.new(email: users(:user1).email, password: passwordValid.to_s)

    # Assert
    assert_not user.valid?
    assert_not user.save
    assert_equal(1, User.all.count)
  end

  test "test_create_one_more_valid_user" do
    # Arrange
    emailValid = "ruby@mess.no"
    passwordValid = "password"
    user = User.new(email: emailValid.to_s, password: passwordValid.to_s)
    assert user.save

    # Assert
    assert_not User.find_by(email: 'ruby@mess.no').nil?
    assert_equal(2, User.all.count)

  end

end
