class SessionsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def omniauth_callback
    begin
      auth = request.env['omniauth.auth']
      github_username = auth.info.nickname

      tmp = GithubOrgMemberCheckService.new(github_username: github_username)

      unless GithubOrgMemberCheckService.new(github_username: github_username).member?
        redirect_to root_path, alert: "RUNTEQメンバーではありません", status: 404
        return
      end

      user = User.find_by(email: auth.info.email)
      if user.nil?
        user = User.new do |u|
          u.name = auth.info.name
          u.email = auth.info.email
          u.role = User.roles[:general]
        end
        user.save!
      end

      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインしました"
    rescue => e
      Rails.logger.error "SessionsController Error: #{e.message}"
      flash.now[:alert] = "ログインに失敗しました"
      redirect_to root_path, status: 500
    end
  end
end
