class Proposal::UsersController < Proposal::ApplicationController
  skip_before_action :require_login, only: [:new, :update]

  def new
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.role = User.roles[:proposal]

    if @user.update(user_params)
      redirect_to proposal_users_path, notice: "プロポーザル情報を更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :x_id, :social_portfolio_url, :image_url)
  end
end
