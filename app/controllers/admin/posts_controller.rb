class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to admin_posts_path, alert: '応募が見つかりません。'
    end
  end
end
