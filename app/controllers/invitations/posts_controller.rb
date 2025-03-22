class Invitations::PostsController < Invitations::ApplicationController
  def show
    @post = current_user.posts.find_by(id: params[:id])
    if @post.nil?
      redirect_to invitation_posts_path, alert: "登壇情報が見つかりません。"
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save!
      redirect_to invitations_post_path(@post), notice: "登壇情報を投稿しました！"
    end
  rescue  => e
    Rails.logger.debug(e)
    flash.now[:alert] = "登壇情報の投稿に失敗しました。"
    render :new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :rule_accepted, :presentation_category, :target_category)
  end
end
