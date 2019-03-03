class Admin::DashBoardController < AdminController

  # Action to show the Admin's Dash board "dashboard/DashBoard":DashBoard.html.erb
  def DashBoard
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

    # If login data is verified
    if @UserInfo.verify != true then
      redirect_to "/admin/login"
    end
  end
end
