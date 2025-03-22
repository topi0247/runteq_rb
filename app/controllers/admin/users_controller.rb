class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all.order(role: :desc)
  end
end
