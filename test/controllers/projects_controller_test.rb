require 'test_helper'


# Functional tests
# what to test:
#   was the web request successful?
#   was the user redirected to the right page?
#   was the user successfully authenticated?
#   was the correct object stored in the response template?
#   was the appropriate message displayed to the user in the view?

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @project = projects(:project1)
    assert @project.valid?
    @user = users(:user1)
    assert @user.valid?
    @valid_password="foofoo"
  end

  teardown do
    @project=nil
    @user=nil
    @valid_password=nil
    logout
  end

  #########     USER NOT LOGGED START   #######
  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should_redirect get new_project" do
    get new_project_url
    assert_response :redirect
    assert_redirected_to user_url(:sign_in)
  end
  test "should_redirect create project" do
    post projects_url, params: { project: { description: @project.description, title: @project.title } }
    assert_response :redirect
    assert_redirected_to user_url(:sign_in)
  end
  test "should show project" do
    get project_url(@project)
    assert_response :success
  end
  test "should_redirect get edit" do
    get edit_project_url(@project)
    assert_response :redirect
    assert_redirected_to user_url(:sign_in)
  end
  test "should redirect_update project" do
    patch project_url(@project), params: { project: { description: @project.description, title: @project.title } }
    # assert_redirected_to project_url(@project)
    assert_redirected_to user_url(:sign_in)
  end
  test "should redirect_destroy project" do
      delete project_url(@project)
      assert_redirected_to user_url(:sign_in)
  end

  #########     USER NOT LOGGED END   #######




  #########     USER !!!LOGGED!!! START   #######
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

  test "should_get new_project" do
    #Arrange
    login

    #Act
    get new_project_url

    #Assert
    assert_response :success
    assert_equal project_url(:new), request.url
    assert_select ("form#new_project.new_project")
  end

  test "should create project" do
    #Arrange
    assert_equal 1, Project.all.count
    login

    #Act
    post projects_url, params: { project: {
        title: @project.title,
        description: @project.description,
        contact: @project.contact,
        user_id: @user.id }
    }

    #Assert
    assert_response :redirect
    assert_redirected_to project_path(Project.last) # (Im sorry but this is so messy framework)
    assert_equal 2, Project.all.count
  end


  test "should get edit" do
    #Arrange
    login

    #Act
    get edit_project_url(@project)

    #Assert
    assert_response :success
    assert_equal edit_project_url(@project), request.url
  end

  test "should update project" do
    #Arrange
    login

    #Act
    patch project_url(@project), params: { project: { description: "new description for project",
                                                      title: "new title for project" } }
    project1 = Project.find_by(id: @project.id)

    #Assert
    assert_redirected_to project_url(@project)

    assert_not project1.nil?
    assert_equal "new description for project", project1.description
    assert_equal "new title for project", project1.title
  end

  test "should_destroy project" do
    #Arrange
    login
    countBefore = Project.all.count

    #Act
    delete project_url(@project)
    countAfter = Project.all.count

    #Assert
    assert_redirected_to projects_url
    assert_equal countAfter, countBefore-1
  end

end
