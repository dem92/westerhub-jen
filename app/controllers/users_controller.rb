class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).reverse_order.paginate(:page => params[:page], per_page: 5)
  end

  def destroy
    @user = current_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
