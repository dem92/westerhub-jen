class CommentsController < ApplicationController
  before_action :special_auth, only: [:new]
  before_action :authenticate_user!, except: [:show]

  respond_to :html, :js

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(params[:comment].permit(:name, :body, :user_id))
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project)
  end

  def new
    @project = Project.find(params[:project_id])
  end

  def special_auth
    if !user_signed_in?
      render :js => "window.location = '#{new_user_session_path}'"
    end
  end

end
