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

  def selection
    @post = Post.find_by(id: post_params[:id])
    Rails.logger.debug("post_params: #{post_params}")
    if @post.nil?
      flash.now[:alert] = '応募が見つかりません。'
      return
    end

    @post.selection = post_params[:selection].to_sym
    if @post.save
      flash.now[:notice] = '選考結果を更新しました。'
    else
      flash.now[:alert] = '選考結果の更新に失敗しました。'
    end
  end

  private

  def post_params
    params.require(:post).permit(:id, :selection)
  end
end
