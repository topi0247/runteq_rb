class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all.order(role: :desc, id: :asc)
  end

  def role_change
    @user = User.find(user_params[:id])
    if @user.update(role: user_params[:role])
      if current_user.admin?
        flash.now[:success] = "ロールが変更されました。"
      else
        redirect_to root_path, alert: "ロールが変更されました。アクセス権限がありません。", status: :see_other
      end
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
