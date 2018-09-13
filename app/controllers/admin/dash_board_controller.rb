class Admin::DashBoardController < AdminController
  def DashBoard
    if session[:AdminID] == nil || session[:AdminPassword] == nil then
      redirect_to "/admin/login"
    else
      @UserInfo = Admins.new
      @UserInfo.id = session[:AdminID]
      @UserInfo.password = session[:AdminPassword]
      if @UserInfo.Verify != true then
        redirect_to "/admin/login"
      end
    end
  end
end
