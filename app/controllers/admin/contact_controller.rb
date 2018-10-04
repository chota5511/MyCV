class Admin::ContactController < AdminController

  # Action to show ShowView "contact/Show":Show.html.erb
  def Show
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

    if @UserInfo.Verify == true then
      @contact = Contact.order('id desc').limit(10)
    else
      redirect_to '/admin/dash-board'
    end
  end

  # Action to delete a contact
  def Delete
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

    if @UserInfo.Verify == true then
      @tmp = Contact.find_by_id(params[:id])
      if @tmp != nil then
        @tmp.destroy
      end
      redirect_to '/admin/contact'
    else
      redirect_to '/admin/dash-board'
    end
  end

  # Action to search contacts
  def Search
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

    if @UserInfo.Verify == true then
      @contact = Array.new
      Contact.all.order('id DESC').each do |c|
        if c.Search(params[:key]) == true then
          @contact << c
        end
      end
      render 'Show'
    else
      redirect_to '/admin/dash-board'
    end
  end

  # Action to show all the contact in database
  def ShowAllContact
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

    if @UserInfo.Verify == true then
      @contact = Contact.order('id desc')
      render 'Show'
    else
      redirect_to '/admin/dash-board'
    end
  end
end
