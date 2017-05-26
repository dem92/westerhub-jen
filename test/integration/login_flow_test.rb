require 'test_helper'

class LoginFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    assert @user.valid?

    @invalid_data="?"
    # need to specify valid password, because in db stores hash (@see fixtures)
    @valid_password = "foofoo"
  end

  def teardown
    @user=nil
  end

  def logout
    delete  "/users/sign_out"
  end

  def login(email, password)
    post "/users/sign_in",
         params: {user: {
             email: email,
             password: password,
             remember_me: 0
         }}
  end

  test "login_existing_user" do
    #Arrange
    logout
    assert_equal 0, @user.sign_in_count

    #Act
    login(@user.email, @valid_password)

    #Assert
    assert_response :redirect
    assert_equal '/users/sign_in', path
    follow_redirect!
    assert_response :success
    assert_equal '/', path
    # refresh object with new db data
    @user.reload
    assert_equal 1, @user.sign_in_count
  end

  # 3 cases: 1.all invalid, 2.email only invalid, 3.password only invalid
  test "login_non_existing_user" do
    #Arrange
    logout

    #Act
    for i in 0..2 do

      if i==0
        login(@invalid_data, @invalid_data)
      end
      if i==1
          login(@user.email, @invalid_data)
      end
      if i==2
            login(@invalid_data, @valid_password)
      end

      #Assert
      assert_select "div.alert.alert-warning", "Invalid Email or password."
      assert_response :success
      assert_equal '/users/sign_in', path
      assert_select "div.alert.alert-warning", 1
    end
  end

  test "login_existing_user_twice" do
    #Arrange
    logout
    assert_equal 0, @user.sign_in_count

    login(@user.email, @valid_password)
    @user.reload
    assert_equal 1, @user.sign_in_count

    #Act (user still in system, send login request again)
    login(@user.email, @valid_password)

    #Assert
    @user.reload
    assert_equal 1, @user.sign_in_count, "User login twice"
  end

  # Delete user, asserts for cascade also
  test "delete_existing_user" do
    #Arrange
    logout
    assert_equal 0, @user.sign_in_count
    login(@user.email, @valid_password)

    @user.reload

    assert_equal 1, @user.sign_in_count

    assert_equal 1, User.all.count
    assert_equal 1, Comment.all.count
    assert_equal 1, Project.all.count


    #Act (user still in system, send login request again)
    delete "/users/#{@user.id}"

    #Assert
    assert_equal 0, User.all.count
    assert_equal 0, Comment.all.count
    assert_equal 0, Project.all.count
  end

end
