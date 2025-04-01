class Proposal::PostsController < Proposal::ApplicationController
  before_action :proposal_time_limit? only: %i[new create]

  def show
    @post = current_user.posts.find_by(id: params[:id])
    if @post.nil?
      redirect_to proposal_root_path, alert: 'プロポーザルが見つかりません。'
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save!
      redirect_to proposal_post_path(@post), notice: 'プロポーザルを投稿しました！'
    end
  rescue  => e
    Rails.logger.debug(e)
    flash.now[:alert] = 'プロポーザルの投稿に失敗しました。'
    render :new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :rule_accepted, :presentation_category, :target_category)
  end

  def enable_post?
    current_user.proposal? || (current_user.general? && !time_limit?)
  end

  def time_limit_redirect?
    if !enable_post?
      redirect_to top_path, flash: { alert: "応募期間は終了しました" }
    end
  end
end
