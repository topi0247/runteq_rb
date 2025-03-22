class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all.order(role: :desc, id: :asc)
  end

  def role_change
    logger.debug user_params
    @user = User.find(user_params[:id])
    if @user.update(role: user_params[:role])
      flash.now[:success] = "ロールを変更しました"
    else
      flash.now[:error] = "ロールの変更に失敗しました"
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :role)
  end
end
