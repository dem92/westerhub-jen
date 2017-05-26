require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @project = projects(:project1)
    assert @project.valid?
    @user = users(:user1)
    assert @user.valid?
    @valid_password="foofoo"
    @comment = comments(:comment1)
    assert @comment.valid?
  end

  teardown do
    @project=nil
    @user=nil
    @valid_password=nil
    @comment=nil
    logout
  end

  #########     USER NOT LOGGED START   #######

  test "should_redirect_create_comment" do
    #Arrange
    logout

    #Act
    post project_comments_path(@project.id), params: { comment: {
        name: @user.first_name,
        user_id: @user.id,
        body: "some text for comment"
    }}

    #Assert
    assert_response :redirect
    assert_redirected_to user_url(:sign_in)
  end

  test "should_redirect_destroy_comment" do
    #Arrange
    logout

    #Act
    delete project_comments_path(@project.id)+"/#{@comment.id}"

    #Assert
    assert_redirected_to user_url(:sign_in)
    assert_equal 1, Comment.all.count
  end

  #########     USER NOT LOGGED END   #######

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


  #########     USER LOGGED START   #######

  test "should_create_comment" do
    #Arrange
    logout
    login
    assert_equal 1 , Comment.all.count

    #Act
    post project_comments_path(@project.id), params: { comment: {
        name: @user.first_name,
        user_id: @user.id,
        body: "some text for comment"
    }}

    #Assert
    assert_equal 2 , Comment.all.count
    assert_response :redirect
    assert_redirected_to project_url(@project)
  end

  test "should_destroy_comment" do
    #Arrange
    logout
    login
    assert_equal 1 , Comment.all.count

    #Act
    delete project_comments_path(@project.id)+"/#{@comment.id}"

    #Assert
    assert_equal 0 , Comment.all.count
    assert_response :redirect
    assert_redirected_to project_url(@project)
  end

  #########     USER LOGGED END   #######


end
