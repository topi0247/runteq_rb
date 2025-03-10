class Invitations::ApplicationController < ApplicationController
  def require_login
    unless current_user
      redirect_to login_path
      return
    end

    if current_user.role != User.roles[:invitation] || current_user.role != User.roles[:admin]
      redirect_to new_proposal_users_path, alert: "権限がありません"
    end
  end
end
