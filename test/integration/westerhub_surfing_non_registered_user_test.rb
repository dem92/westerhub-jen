require 'test_helper'

### Class for testing actions of unregistered user

class WesterhubSurfingNonRegisteredUserTest < ActionDispatch::IntegrationTest

  test "can see the welcome page_not_logged" do
    get "/"
    assert_response :success
    assert_select "h1", "Westerhub"
    assert_equal '/', path
  end

  test "can see the projects page not logged" do
    get "/projects"
    assert_response :success
    assert_equal '/projects', path
    assert_select "a", {:text=>"New project"},
                                    "Button create has title New Project"
  end

  test "can see sign up page not logged" do
    get "/users/sign_up"
  end

  test "new_project_user_not_logged_redirect_to_sign_in" do
    get "/projects/new"
    # just try to fail test
    # assert_response :success
    assert_response :redirect
    follow_redirect!
    assert_equal '/users/sign_in', path
  end

  test "edit_project_user_not_logged_redirect_to_sign_in" do
    delete "/projects/#{projects(:project1).id}"
    assert_response :redirect
    follow_redirect!
    assert_equal '/users/sign_in', path
  end

end
