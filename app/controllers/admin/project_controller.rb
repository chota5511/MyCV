class Admin::ProjectController < AdminController

  #Action to show ShowView "project/Show":Show.html.erb
  def Show
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])
    # If login data is verified
    if @UserInfo.Verify == true then
      @project = Project.all
    else
      redirect_to '/admin/dash-board'
    end
  end

  # Action to edit the selected project
  def Edit
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])
    # Find porject by ID
    @tmp = Project.find_by_id(params[:id])
    image_io = params[:image]

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
      redirect_to '/admin/project'
    else
      redirect_to '/admin/dash-board'
    end
  end

  # Action to create a project
  def Create
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

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
      redirect_to '/admin/project'
    else
      redirect_to '/admin/dash-board'
    end
  end

  # Action to search for project
  def Search
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

    # If login data is verified
    if @UserInfo.Verify == true then

      # Initial new array to store project of the searcher
      @project = Array.new

      # Find project that the keywords match with project's keywords pool
      Project.all.each do |p|
        if p.Search(params[:key]) == true then
          @project << p
        end
      end
      render 'Show'
    else
      redirect_to '/admin/dash-board'
    end
  end

  # Action to delete a project
  def Delete
    # Get login info from session
    @UserInfo = Admins.new(session[:UserInfo])

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
        redirect_to '/admin/project'
      end
    else
      redirect_to '/admin/dash-board'
    end
  end
end
