class Proposal::ApplicationController < ApplicationController
  before_action :require_user_registration

  def require_user_registration
    if current_user.general?
      if time_limit?
        redirect_to root_path, flash: { alert: "登壇応募は終了しました" }
      else
        redirect_to edit_proposal_users_path, flash: { alert: "ユーザー情報の登録をお願いします" }
      end
    end
  end

  def proposal_time_limit?
    if time_limit?
      redirect_to top_path, flash: { alert: "応募期間が終了しました" }
    end
  end
end
