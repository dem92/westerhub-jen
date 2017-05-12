require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @user = users(:user1)
    assert @user.valid?
    @project = projects(:project1)
    assert @project.valid?

    # test variables
    @shortTitle = "0"*2
    assert @shortTitle.to_s.length<3
    @longTitle = "0"*51
    assert @longTitle.to_s.length>50
    @validTitle = @project.title
    assert @validTitle.to_s.length>3 && @validTitle.to_s.length<50
    @shortDescription = "0" * 9
    assert @shortDescription.to_s.length<10
    @longDescription = "0" * 30001
    assert @longDescription.to_s.length>30000
    @shortContact = "0"*7
    assert @shortContact.to_s.length<8
    @longContact = "0"*251
    assert @longContact.to_s.length>250
  end

  def teardown
    @user=nil
    @project=nil
  end

private
  def getValidProject
     project=Project.new(
        title:@project.title,
        description:@project.description,
        contact:@project.contact,
        user_id:@project.user_id)
    assert project.valid?
    return project
  end

  test "setup_fixture_projects" do
    assert_equal(1, Project.all.count)
    assert_equal(1, @user.projects.count)
    assert_equal(@user.id, Project.all.first.user_id)
  end


  ###########     PROJECT VALIDATION START    ###########

  test "project attributes validation_on_empty" do
    project = Project.new
    assert_not project.valid?
    assert project.errors[:description].any?
    assert project.errors[:title].any?
    assert project.errors[:contact].any?
  end

  test "create_valid_project" do
    assert getValidProject.save
    assert_equal(2, Project.all.count)
  end

  test "project_title_validation" do
    #Arrange
    projectNoTitle = getValidProject
    projectNoTitle.title=nil

    projectBlankTitle = getValidProject
    projectBlankTitle.title=""

    projectShortTitle = getValidProject
    projectShortTitle.title=@shortTitle

    projectLongTitle = getValidProject
    projectLongTitle.title = @longTitle

    #Assert
    assert_not projectNoTitle.valid?
    assert projectNoTitle.errors[:title].any?

    assert_not projectBlankTitle.valid?
    assert projectBlankTitle.errors[:title].any?

    assert_not projectShortTitle.valid?
    assert projectShortTitle.errors[:title].any?

    assert_not projectLongTitle.valid?
    assert projectLongTitle.errors[:title].any?
  end

  test "project_description_validation" do
    #Arrange
    projectNoDescription = getValidProject
    projectNoDescription.description=nil

    projectBlankDescription = getValidProject
    projectBlankDescription.description=""

    projectShortDescription = getValidProject
    projectShortDescription.description = @shortDescription

    projectLongDescription = getValidProject
    projectLongDescription.description = @longDescription

    #Assert
    assert_not projectNoDescription.valid?
    assert projectNoDescription.errors[:description].any?

    assert_not projectBlankDescription.valid?
    assert projectBlankDescription.errors[:description].any?

    assert_not projectShortDescription.valid?
    assert projectShortDescription.errors[:description].any?

    assert_not projectLongDescription.valid?
    assert projectLongDescription.errors[:description].any?
  end

  test "project_contact_validation" do
    #Arrange
    projectNoContacts = getValidProject
    projectNoContacts.contact = nil

    projectBlankContact = getValidProject
    projectBlankContact.contact=""

    projectShortContact = getValidProject
    projectShortContact.contact = @shortContact

    projectLongContact = getValidProject
    projectLongContact.contact = @longDescription

    #Assert
    assert_not projectNoContacts.valid?
    assert projectNoContacts.errors[:contact].any?

    assert_not projectBlankContact.valid?
    assert projectBlankContact.errors[:contact].any?

    assert_not projectShortContact.valid?
    assert projectShortContact.errors[:contact].any?

    assert_not projectLongContact.valid?
    assert projectLongContact.errors[:contact].any?
  end

  ###########     PROJECT VALIDATION END    ###########



  test "create_project_not_existing_user_id" do
    #Arrange
    project = getValidProject
    project.user_id = -1

    #Act
    #Assert
    # assert_not project.valid?
    assert_not project.save,"Project can not be persisted with non existing user_id"
    assert_equal 1, Project.all.count
  end


  test "create_project existing_user" do
    #Arrange
    project = getValidProject
    project.user_id = @user.id

    #Act
    #Assert
    assert project.save
    # +1 fixture
    assert_equal(2, Project.all.count)
  end


end
