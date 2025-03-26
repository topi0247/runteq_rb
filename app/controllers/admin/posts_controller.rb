class Admin::PostsController < Admin::ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to admin_posts_path, alert: '応募が見つかりません。'
    end
  end
end