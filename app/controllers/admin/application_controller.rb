class Admin::ApplicationController < ApplicationController
  def require_login
    unless current_user
      redirect_to login_path
      return
    end

    unless current_user.admin?
      redirect_to root_path, alert: "権限がありません"
    end
  end
end
