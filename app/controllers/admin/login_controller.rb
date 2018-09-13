class Admin::LoginController < ApplicationController
  #Set this controller has no layout
  layout false

  #Action to show Login view "login/Show":Show.html.erb
  def Show
    if session[:AdminID] != nil && session[:AdminPassword] != nil then
      @UserInfo = Admins.new
      @UserInfo.id = session[:AdminID]
      @UserInfo.password = session[:AdminPassword]
      if @UserInfo.Verify == true then
        redirect_to "/admin/dash-board"
      end
    end
  end

  #Action to get and verify the in put Admin user name and password "login/Login"
  def Login
    @tmp = Admins.new
    @tmp.id = params[:id]
    @tmp.password = params[:password]
    if @tmp.Verify == true then
      session[:AdminID] = @tmp.id
      session[:AdminPassword] = @tmp.password
      if session[:LoginStatus] != nil then
        session[:LoginStatus] = nil
      end
      redirect_to "/admin/dash-board"
    else
      session[:LoginStatus] = "User ID or password is incorect"
      redirect_to "/admin/login"
    end
  end

  #Action to clear up Admin session and logout
  def SignOut
    if session[:AdminID] != nil then
      session[:AdminID] = nil
      session[:AdminPassword] = nil
      redirect_to "/admin/login"
    else
      redirect_to "/admin/login"
    end
  end
end
