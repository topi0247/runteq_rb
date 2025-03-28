class Admin::CandidatesController < Admin::ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.candidate(post)
    redirect_to request.url, flash: { success: "候補にしました" }
  end

  def destroy
    post = current_user.candidates.find(params[:id]).post
    current_user.uncandidate(post)
    redirect_to request.url, flash: { success: "候補を削除しました" }, status: :see_other
  end
end
