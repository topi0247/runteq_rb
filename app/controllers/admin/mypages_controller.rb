class Admin::MypagesController < Admin::ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to admin_mypages_path, notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :x_id, :social_portfolio_url, :image_url, :comment)
  end
end
