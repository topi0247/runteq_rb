# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

50.times do |i|
  user = User.find_or_initialize_by(email: "test#{i}@example.com") do |u|
    u.name = "test#{i}"
    u.x_id = "@test#{i}"
    u.social_portfolio_url = "https://example.com/#{i}"
    u.image_url = "https://placehold.jp/500x500.png?hoge=#{i}"
    u.role = User.roles.keys.sample
  end
  user.save!
end

invitation_count = 0
lt_count = 0
proposal_count = 0
User.all.each_with_index do |user, i|
  post = user.posts.build do |p|
    p.title = "test#{i}"
    p.content = "test_#{i}" * 40
    p.rule_accepted = true
    p.presentation_category = Post.presentation_categories.keys.sample
    p.target_category = Post.target_categories.keys.sample
  end

  if invitation_count < 3
    post.content = "test_invitation_#{i}" * 40
    post.presentation_position = invitation_count + 1
    post.content = "test_invitation_#{i}" * 40
    post.selection = Post.selections[:adoption]
    post.presentation_category = Post.presentation_categories[:invitation]
    invitation_count += 1
  elsif lt_count < 5
    post.presentation_position = lt_count + 1
    post.content = "test_lt_#{i}" * 40
    post.selection = Post.selections[:adoption]
    post.presentation_category = Post.presentation_categories[:lt]
    lt_count += 1
  elsif proposal_count < 5
    post.presentation_position = proposal_count + 1
    post.content = "test_proposal_#{i}" * 40
    post.selection = Post.selections[:adoption]
    post.presentation_category = Post.presentation_categories[:proposal]
    proposal_count += 1
  end

  post.save!
end
