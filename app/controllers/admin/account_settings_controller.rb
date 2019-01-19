class Admin::AccountSettingsController < AdminController
  def Show
    @UserInfo = Admins.new(session[:UserInfo])
  end
end
