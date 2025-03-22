class Admin::PostsController < ApplicationController
  # ひとまずApplicationControllerを継承
  def index
    @posts = Post.includes(:user).all
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to admin_posts_path, alert: '応募が見つかりません。'
    end
  end
end
