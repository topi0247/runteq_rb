class TimelinesController < ApplicationController
  def index
    posts = Post.includes(:user).where(selection: Post.selections[:adoption]).order(presentation_position: :asc)
    @invitations = posts.where(presentation_category: Post.presentation_categories[:invitation])
    @lts = posts.where(presentation_category: Post.presentation_categories[:lt])
    @proposals = posts.where(presentation_category: Post.presentation_categories[:proposal])
    @admins = User.where(role: User.roles[:admin]).order(created_at: :asc)
  end
end
