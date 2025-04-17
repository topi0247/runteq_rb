class Admin::CandidatesController < Admin::ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.candidate(@post)
  end

  def destroy
    @post = current_user.candidates.find(params[:id]).post
    current_user.uncandidate(@post)
  end
end
