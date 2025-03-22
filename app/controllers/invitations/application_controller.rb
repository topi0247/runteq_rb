class Invitations::ApplicationController < ApplicationController
  before_action :ensure_invitation_or_admin

  def ensure_invitation_or_admin
    # 招待枠ユーザー or 管理者ユーザー以外はアクセス不可
    if !(current_user.invitation? || current_user.admin?)
      redirect_to root_path, alert: "権限がありません"
    end
  end
end
