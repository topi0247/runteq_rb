class Proposal::ApplicationController < ApplicationController

  def require_login
    unless current_user
      redirect_to login_path
    end

    if current_user.role == User.roles[:general]
      redirect_to new_proposal_users_path, alert: "プロポーザルの登録をお願いします"
    end
  end
end
