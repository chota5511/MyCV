class Admin::ToolController < AdminController

  def Show
    @UserInfo = Admins.new(session[:UserInfo])
    @devlanguage = DevLanguage.all
  end

  # Action to Search tools by keywords
  def Search

  end

  # Action create a tool
  def Create

  end

  # Action to delete a tool
  def Delete

  end

  # Action to edit a tool
  def Edit

  end
end
