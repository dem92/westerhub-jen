class UsersController < ApplicationController

  # before_action :profile_owner, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # add this method
  # def profile_owner
  #   unless
  #     @user.id == current_user.id
  #     flash[:notice] = 'Access denied as you are not owner of this Job'
  #     redirect_to users_show_path
  #   end
  # end

end
