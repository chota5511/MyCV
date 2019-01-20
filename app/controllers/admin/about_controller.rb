class Admin::AboutController < AdminController
  def Show
    @UserInfo = Admins.new(session[:UserInfo])

    if @UserInfo.Verify == true then
      @skills = Skill.order('id desc').all
      @persionalInfo = PersionalInfo.first
      
    else
      redirect_to '/admin/dash-board'
    end

  end

  def EditSkill

  end

  def DelSkill

  end

  def AddSkill

  end
end
