class Admin::PostsController < Admin::ApplicationController
  def index
    @q = Post.ransack(params[:q])
    if params[:selection].to_i == Post.selections[:adoption]
      @posts = Post.where(selection: Post.selections[:adoption]).sort_by(&:presentation_position)
    else
      if params[:sort_by] == 'favorite'
        @posts = @q.result.includes(:candidates, :user).sort { |a,b| b.candidates.count <=> a.candidates.count }
      else
        @posts = @q.result.includes(:user).order(created_at: :desc)
      end
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to admin_posts_path, alert: '応募が見つかりません。'
    end
  end

  def selection
    @post = Post.find_by(id: post_params[:id])
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