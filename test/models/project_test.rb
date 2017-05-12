require 'test_helper'

class ProjectTest < ActiveSupport::TestCase


  test "test_setup_fixture_projects" do
    assert_equal(1, Project.all.count)
    assert_equal(1, users(:user1).projects.count)
    assert_equal(users(:user1).id, Project.all.first.user_id)
  end

  test "test_project attributes must not be empty" do
    project = Project.new
    assert_not project.valid?
    assert project.errors[:description].any?
    assert_equal(2, project.errors[:description].count)
    assert_equal ["can't be blank", "is too short (minimum is 5 characters)"],
                 project.errors[:description]
  end

  test "test_create_project_not_existing_user_id" do
    project = Project.new
    project.description = "dsada"
    project.user_id = 2432432
    assert_not project.valid?
    assert_not project.save
    assert(0, Project.all.count)
  end

  test "test_create_project valid_data" do
    project = Project.new
    project.description = "dsada"
    project.user_id = users(:user1).id
    assert project.valid?
    assert project.save
    # +1 fixture
    assert_equal(2, Project.all.count)
  end


end
