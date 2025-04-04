class Proposal::UsersController < Proposal::ApplicationController
  skip_before_action :require_user_registration, only: %i[edit update]
  before_action :proposal_time_limit, only: %i[show edit update]

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
      redirect_to proposal_root_path, flash: { success: "ユーザー情報を更新しました" }
    else
      flash.now[:error] = "ユーザー情報の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :x_id, :social_portfolio_url, :image_url)
  end

  def proposal_time_limit
    if current_user.general? && time_limit?
      redirect_to top_path, alert: '登壇応募は終了しました'
    end
  end
end
