class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.includes(:user).all
  end
end
