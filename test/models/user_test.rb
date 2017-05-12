require 'test_helper'

class UserTest < ActiveSupport::TestCase


  def setup
    @user = users(:user1)
    assert @user.valid?
  end

  def teardown
    @user=nil
  end

  # Just to see how fixtures works
  test "test_setup_fixture_users" do
    assert_equal(1, User.all.count)

    userExist = User.find_by(email: 'foo@bar.no')
    userNotExist = User.find_by(email: 'r')

    assert_not userExist.nil?
    assert userNotExist.nil?
    assert_equal(1, User.all.count)
    assert_equal("foo@bar.no", userExist.email)
    assert_equal("foo@bar.no", @user.email)

    # try to save existing user again

    assert @user.valid?
    assert @user.save       # persist, do nothing if object have already serialized
    assert_equal(1, User.all.count)
  end

  ###########     USER VALIDATION START    ###########


  #1     all essential fields
  test "test_user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?, "email validation"
    assert user.errors[:password].any?, "passwrod validation"
    assert user.errors[:username].any?, "username validation"
    assert user.errors[:first_name].any?, "first name validation"
    assert user.errors[:last_name].any?, "last name validation"
  end

  #2    email (devise validation)
  test "test_user_email_not_match_reg_expression" do
    #Arrange
    user = @user

    #Act
    #Assert
    user.email="s"
    assert_not user.valid?

    user.email="a@a"
    assert_not user.valid?

    user.email="a@a."
    assert_not user.valid?

    user.email="a@a.n"
    assert user.valid?
  end

  #3    username   expression ^[a-z0-9_-]{3,15}$
  #     only english, no uppercase, no unicorns symbols(letters), no numbers, 3-30 length
  test "test_user_username_validation" do
    #Arrange
    user = @user

    #Act
    #Assert
    user.username=nil
    assert_not user.valid?, "username must presence"

    user.username="UPPPERCASE"
    assert_not user.valid?, "username contains upper case"

    user.username="fo"
    assert user.username.to_s.length < 3
    assert_not user.valid?, "username is too short"

    user.username="123456789101112131415"
    assert user.username.to_s.length > 15
    assert_not user.valid?, "username is too long"

    user.username="foo foo !£∞£"
    assert_not user.valid?, "username does not match reg exp: ^[a-z0-9_-]{3,15}$"

    user.username="foo_123-"
    assert user.valid?, "username does not match reg exp: ^[a-z0-9_-]{3,15}$"
  end

  #4    first name   expression [a-zA-Z]{2,30} -
  #     only english, no unicorns symbols(letters), no numbers, 3-30 length
  test "test_user_first_name_validation1" do
    #Arrange
    user = @user

    #Act
    #Assert

    user.first_name="a"
    assert user.first_name.to_s.length < 2
    assert_not user.valid?, "first name is too short"

    user.first_name="abcdefgasdasdasdasdasdagfdgdfgdfgdfgdfgdf"
    assert user.first_name.to_s.length > 30
    assert_not user.valid?, "first name is too long"

    user.first_name="123"
    assert_not user.valid?, "first name does not match reg exp | contains numbers"

    user.first_name="привет как дела"
    assert_not user.valid?, "first name does not match reg exp | russian letters"

    user.first_name="foo!™£¢∞§¶"
    assert_not user.valid?, "first name does not match reg exp | special symbols"

    user.first_name="joakim"
    assert user.valid?

  end


  #5    last name   expression [a-zA-Z]{2,30} -
  #     only english, no unicorns symbols(letters), no numbers, 3-30 length
  test "test_user_last_name_validation1" do
    #Arrange
    user = @user

    #Act
    #Assert

    user.last_name="a"
    assert user.last_name.to_s.length < 2
    assert_not user.valid?, "last name is too short"

    user.last_name="abcdefgasdasdasdasdasdagfdgdfgdfgdfgdfgdf"
    assert user.last_name.to_s.length > 30
    assert_not user.valid?, "last name is too long"

    user.last_name="123"
    assert_not user.valid?, "last name does not match reg exp | contains numbers"

    user.last_name="привет, как дела"
    assert_not user.valid?, "last name does not match reg exp | russian letters"

    user.last_name="foo!™£¢∞§¶"
    assert_not user.valid?, "last name does not match reg exp | special symbols"

    user.last_name="joakim"
    assert user.valid?

  end
  ###########     USER VALIDATION END    ###########



  test "test_create_save_new_valid_users_email_username_unique" do
    #Arrange
    userValid = User.new(
        email: "eva@gmail.no",
        password: "foobar123",
        username: "evaeva",
        first_name: @user.first_name,
        last_name: @user.last_name)
    #Assert
    assert userValid.valid?
    assert userValid.save
    assert_equal(2, User.all.count)
  end

  test "test_create_save_new_users_email_not_unique" do
    #Arrange
    userEmailConstraint = User.new(
        email: @user.email,
        password: "foobar123",
        username: "evaeva",
        first_name: @user.first_name,
        last_name: @user.last_name)
    #Assert
    assert_not userEmailConstraint.valid?
    assert userEmailConstraint.errors[:email].any?
    assert_not userEmailConstraint.save
    assert_equal(1, User.all.count)
  end

  test "test_create_save_new_users_username_not_unique" do
    #Arrange
    userUsernameConstraint = User.new(
        email: "eva@eva.no",
        password: "foobar123",
        username: @user.username,
        first_name: @user.first_name,
        last_name: @user.last_name)
    #Assert
    assert_not userUsernameConstraint.valid?
    assert userUsernameConstraint.errors[:username].any?
    assert_not userUsernameConstraint.save
    assert_equal(1, User.all.count)
  end

end
