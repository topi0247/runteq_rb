class Proposal::ApplicationController < ApplicationController
  before_action :require_user_registration

  def require_user_registration
    if current_user.general?
      redirect_to edit_proposal_users_path, flash: { alert: "ユーザー情報の登録をお願いします" }
    end
  end
end
