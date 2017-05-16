require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
    assert @user.valid?
    @valid_password="foofoo"
  end

  def teardown
    logout
  end

  private
  def login
    post "/users/sign_in",
         params: {user: {
             email: @user.email,
             password: @valid_password,
             remember_me: 0
         }}
    assert_response :redirect
    assert_redirected_to root_path
  end

  private
  def logout
    delete  "/users/sign_out"
  end

  test "should show user" do
    #Act
    get user_url(@user)

    #Assert
    assert_response :success
    assert_equal user_url(@user), request.url
  end

  test "should show users" do
    #Act
    get users_url

    #Assert
    assert_response :success
    assert_equal users_url, request.url
  end

  test "should_destroy user" do
    #Arrange
    countBefore=User.all.count
    login

    #Act
    delete user_url(@user)
    countAfter = User.all.count

    #Assert
    assert_response :redirect
    assert_equal countAfter, countBefore-1
  end

end
