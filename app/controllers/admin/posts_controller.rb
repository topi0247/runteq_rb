class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.includes(:user).all
    if params[:presentation_category].present?
      @posts = @posts.where(presentation_category: params[:presentation_category])
    end
    if params[:target_category].present?
      @posts = @posts.where(target_category: params[:target_category])
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to admin_posts_path, alert: '応募が見つかりません。'
    end
  end
end
