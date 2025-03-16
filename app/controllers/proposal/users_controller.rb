class Proposal::UsersController < Proposal::ApplicationController
  skip_before_action :require_user_registration, only: [:edit]

  def show
    @user = current_user
    @posts = current_user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.role = :proposal

    if @user.update(user_params)
      redirect_to proposal_root_path, notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :x_id, :social_portfolio_url, :image_url)
  end
end
