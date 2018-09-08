class Admin::DashBoardController < AdminController
  def DashBoard
    if session[:UserInfo] == nil then
      redirect_to "/admin/login/Show"
    end
  end
end
