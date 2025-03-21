class Admin::ApplicationController < ApplicationController
  def require_login
    redirect_to login_path unless current_user

    if !current_user.admin?
      redirect_to root_path, alert: "権限がありません"
    end
  end
end