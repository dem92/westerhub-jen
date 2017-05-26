require 'test_helper'

class CommentTest < ActiveSupport::TestCase
 def setup
   @user = users(:user1)
   assert @user.valid?
   @project = projects(:project1)
   assert @project.valid?
   @comment = comments(:comment1)
   assert @comment.valid?

   # test variables
   @shortName = "0"
   assert @shortName.to_s.length<2
   @longName = "0"*31
   assert @longName.to_s.length>30
   @validName = @comment.name
   assert @validName.to_s.length>3 && @validTitle.to_s.length<50
   @shortBody = "0" * 9
   assert @shortBody.to_s.length<10
   @longBody = "0" * 501
   assert @longBody.to_s.length>500
   @validBody = @comment.body
 end

  def teardown
    @user = nil
    @project = nil
    @comment = nil
  end

 private
 def getValidComment
   comment=Comment.new(
       name:@comment.name,
       body:@comment.body,
       project_id:@comment.project_id,
       user_id:@comment.user_id)
   assert comment.valid?
   return comment
 end

 test "setup_fixture_comments" do
   assert_equal(1, Project.all.count)
   assert_equal(1, @user.projects.count)
   assert_equal(1, Comment.all.count)
 end

  ###########     COMMENT VALIDATION START    ###########

  test "comment attributes validation_on_empty" do
    comment = Comment.new
    assert_not comment.valid?
    # assert_equal comment.valid?, false
    assert comment.errors[:name].any?
    assert comment.errors[:body].any?
    assert comment.errors[:user].any?
    assert comment.errors[:project].any?
  end

  test "create_valid_comment" do
    assert getValidComment.save
    assert_equal(2, Comment.all.count)
  end

  test "comment_name_validation" do
    commentNoName = getValidComment
    commentNoName.name = nil

    commentBlankName = getValidComment
    commentBlankName.name = ""

    commentShortName = getValidComment
    commentShortName.name = @shortName

    commentLongName = getValidComment
    commentLongName.name = @longName

    assert_not commentNoName.valid?
    assert commentNoName.errors[:name].any?

    assert_not commentBlankName.valid?
    assert commentBlankName.errors[:name].any?

    assert_not commentShortName.valid?
    assert commentShortName.errors[:name].any?

    assert_not commentLongName.valid?
    assert commentLongName.errors[:name].any?
  end

 test "comment_body_validation" do
   commentNoBody = getValidComment
   commentNoBody.body = nil

   commentBlankBody = getValidComment
   commentBlankBody.body = ""

   commentShortBody = getValidComment
   commentShortBody.body = @shortBody

   commentLongBody = getValidComment
   commentLongBody.body = @longBody

   assert_not commentNoBody.valid?
   assert commentNoBody.errors[:body].any?

   assert_not commentBlankBody.valid?
   assert commentBlankBody.errors[:body].any?

   assert_not commentShortBody.valid?
   assert commentShortBody.errors[:body].any?

   assert_not commentLongBody.valid?
   assert commentLongBody.errors[:body].any?
 end

  test "create_comment_not_existing_user_id" do
    comment = getValidComment
    comment.user_id = -1

    assert_not comment.save
    assert_equal(1, Comment.all.count)
  end

 test "create_comment_not_existing_project_id" do
   comment = getValidComment
   comment.project_id = -1

   assert_not comment.save
   assert_equal(1, Comment.all.count)
 end

end
