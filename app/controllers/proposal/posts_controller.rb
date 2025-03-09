class Proposal::PostsController < ApplicationController
  def show; end

  def new; end

  def create; end

  private

  def post_params
    params.require(:post).permit(:title, :content, :rule_accepted)
  end
end
