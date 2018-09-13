class Admin::ProjectController < AdminController

  def Show
    # If login data is not null
    if session[:AdminID] != nil && session[:AdminPassword] != nil then
      @UserInfo = Admins.new
      @UserInfo.id = session[:AdminID]
      @UserInfo.password = session[:AdminPassword]

      # If login data is verified
      if @UserInfo.Verify == true then
        @project = Project.all
      else
        redirect_to "/admin/dash-board"
      end
    else
      redirect_to "/admin/dash-board"
    end
  end

  # Action to edit the selected project
  def Edit
    # Find porject by ID
    @tmp = Project.find_by_id(params[:id])
    image_io = params[:image]

    # If Project ID and login data is available
    if @tmp != nil && session[:AdminID] != nil && session[:AdminPassword] != nil then
      @UserInfo = Admins.new
      @UserInfo.id = session[:AdminID]
      @UserInfo.password = session[:AdminPassword]
      # If login data is verified
      if @UserInfo.Verify == true then
        # If any of the parameters was changed
        if @tmp.name != params[:name] || @tmp.link != params[:link] || @tmp.description != params[:description] || image_io != nil then

          # If name was changed
          if @tmp.name != params[:name] then
            @tmp.name = params[:name]
          end

          # If link was changed
          if @tmp.link != params[:link] then
            @tmp.link = params[:link]
          end

          # If description was changed
          if @tmp.description != params[:description] then
            @tmp.description = params[:description]
          end

          # Override project image by new project image
          if image_io != nil then
            File.open(Rails.root.join('app','assets','images',"p#{@tmp.id}.png"),'wb') do |file|
              file.write(image_io.read)
            end
          end

          # Save changed
          @tmp.save
        end
        redirect_to "/admin/project"
      else
        redirect_to "/admin/dash-board"
      end
    end
  end

  # Action to create a project
  def Create
    # If login data is not null
    if session[:AdminID] != nil && session[:AdminPassword] then
      @UserInfo = Admins.new
      @UserInfo.id = session[:AdminID]
      @UserInfo.password = session[:AdminPassword]
      # If login data is verified
      if @UserInfo.Verify == true then

        # Create a project
        @tmp = Project.new
        @tmp.name = params[:name]
        @tmp.link = params[:link]
        @tmp.description = params[:description]
        @tmp.save

        # Create project image with project ID
        image_io = params[:image]
        File.open(Rails.root.join('app','assets','images',"p#{@tmp.id}.png"),'wb') do |file|
          file.write(image_io.read)
        end

        redirect_to "/admin/project"
      end
    end
  end

  def Search
    # If login data is not null
    if session[:AdminID] != nil && session[:AdminPassword] then
      @UserInfo = Admins.new
      @UserInfo.id = session[:AdminID]
      @UserInfo.password = session[:AdminPassword]
      # If login data is verified
      if @UserInfo.Verify == true then

        # Initial new array to store project of searcher
        @project = Array.new

        # Find project that the keywork match with project's keywork pool
        Project.all.each do |a|
          @tmp = "#{a.id} #{a.name} #{a.link} #{a.description}"
          if @tmp.include? params[:key] then
            @project << a
          end
        end
        render 'Show'
      else
        redirect_to "/admin/dash-board"
      end
    else
      redirect_to "/admin/dash-board"
    end
  end

  # Action to delete a project
  def Delete
    # If login data is not null
    if session[:AdminID] != nil && session[:AdminPassword] then
      @UserInfo = Admins.new
      @UserInfo.id = session[:AdminID]
      @UserInfo.password = session[:AdminPassword]
      # If login data is verified
      if @UserInfo.Verify == true then
        # Find project by ID
        @tmp = Project.find_by_id(params[:id])

        # If project ID is available
        if @tmp != nil then
          # Delete a project with project ID
          @tmp.destroy

          # Delete project image with project ID
          if File.exists? Rails.root.join('app','assets','images',"p#{@tmp.id}.png") then
            File.delete Rails.root.join('app','assets','images',"p#{@tmp.id}.png")
          end

        end
      end
      redirect_to "/admin/project"
    else
      redirect_to "/admin/project"
    end
  end
end
