module Admin::ApplicationHelper
  def turbo_update_flash
    turbo_stream.update "flash", partial: "shared/flash_message"
  end
end
