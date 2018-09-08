class Admin::LoginController < ApplicationController
  #Set this controller has no layout
  layout false

  #Action to show Login view "login/Show":Show.html.erb
  def Show
    if session[:UserInfo] != nil then
      redirect_to "/admin/dash_board/DashBoard"
    end
  end

  #Action to get and verify the in put Admin user name and password "login/Login"
  def Login
    @tmp = Admins.new
    @tmp.id = params[:id]
    @tmp.password = params[:password]
    if @tmp.Verify == true then
      session[:UserInfo] = @tmp
      if session[:LoginStatus] != nil then
        session[:LoginStatus] = nil
      end
      redirect_to "/admin/dash_board/DashBoard"
    else
      session[:LoginStatus] = "User ID or password is incorect"
      redirect_to "/admin/login/Show"
    end
  end

  #Action to clear up Admin session and logout
  def SignOut
    if session[:UserInfo] != nil then
      session[:UserInfo] = nil
      redirect_to "/admin/login/Show"
    else
      redirect_to "/admin/login/Show"
    end
  end
end
