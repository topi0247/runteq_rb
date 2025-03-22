class Admin::PostsController < Admin::ApplicationController
  def show
    @post = current_user.posts.find_by(id: params[:id])
    if @post.nil?
      redirect_to proposal_posts_path, alert: 'プロポーザルが見つかりません。'
    end
  end
end
