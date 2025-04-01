class Proposal::ApplicationController < ApplicationController
  before_action :require_user_registration

  def require_user_registration
    if time_limit?
      redirect_to top_path, flash: { alert: "応募期間が終了しました" }
    elsif current_user.general?
      redirect_to edit_proposal_users_path, flash: { alert: "ユーザー情報の登録をお願いします" }
    end
  end

  def proposal_time_limit?
    if time_limit?
      redirect_to top_path, flash: { alert: "応募期間が終了しました" }
    end
  end
end
