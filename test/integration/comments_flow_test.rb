require 'test_helper'

class LoginFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    assert @user.valid?
    @user_comment = comments(:comment1)
    assert @user_comment.valid?

    @invalid_data="?"
  end

  def teardown
    @user=nil
    @user_comment=nil
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


  test "setup_fixture_comment" do
    assert_equal(1, Comment.all.count)
    assert_equal(Comment.all.first.user_id, @user.id)
    assert_equal(1, @user.comments.count)
  end


  # Get request on button new comment
  # test "create_new_comment_not_logged_try_1" do
  #   #Arrange
  #   logout
  #   assert_equal 0, @user.sign_in_count
  #   # login(@user.email, @valid_password)
  #   #Act
  #
  #   get "/projects/#{projects(:project1).id}/comments/new"
  #
  #   #Assert
  #   # assert_response :redirect
  #   assert_response :success
  #   follow_redirect!
  #   assert_response :success
  #   assert_equal '/users/sign_in', path
  # end

  # Post request avoiding button
  test "create_new_comment_not_logged_try_2" do
    #Arrange
    logout
    assert_equal 0, @user.sign_in_count

    #Act
    post "/projects/#{projects(:project1).id}/comments",
         params: { comment: {
             name: @user.first_name,
             user_id: @user.id,
             body: "some text for comment"
         }}

    #Assert
    assert_equal 1, Comment.all.count
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/users/sign_in', path
  end

  test "delete_comment_not_logged" do
    #Arrange
    logout

    #Act
    assert_equal 1, Comment.all.count
    delete "/projects/#{projects(:project1).id}/comments/#{comments(:comment1).id}"

    #Assert
    assert_equal 1, Comment.all.count
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/users/sign_in', path
  end

end
