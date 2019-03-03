class HomeController < ApplicationController
  protect_from_forgery with: :exception
  def Home
    begin
      #Main Variables
      @name = Figaro.env.NAME_HOME
      @intro = Figaro.env.INTRO_HOME
      @quote = Figaro.env.QUOTE_HOME
      @quoteowner = Figaro.env.QUOTE_OWNER_HOME
      pi = PersionalInfo.first
      p = Project.limit(5)

      #Partial View "home/Banner": _Banner.html.erb
      @specialist = Specialized.find_by_id(pi.specializedid).name
      @about = PersionalInfo.first.about

      #Partial View "home/Tool": _Tool.html.erb
      @devlanguage = DevLanguage.all

      #Partial View "home/About": _About.html.erb
      @skill = Skill.all
      @email = pi.email
      @phone = pi.phone

      #Partial View "home.Project": _Project.html.erb
      @project = p
    rescue => e
      puts e.message
      render_404
    end
  end

  #Contact Submit Sucess View
  def SubmitSucess
    if session[:contact_name] == nil
      #Redirect to "home/Home": Home.html.erb if no message wasn't send
      redirect_to "/home"
    else
      #Render "home/SubmitFailed": SubmitFailed.html.erb and erase session[:contact_name]
      @name = session[:contact_name]
      session[:contact_name] = nil
    end
  end

  #Contact Submit Failed View
  def SubmitFailed
    if session[:contact_name] == nil
      #Redirect to "home/Home": Home.html.erb if no message wasn't send
      redirect_to "/home"
    else
      #Render "home/SubmitFailed": SubmitFailed.html.erb and erase session[:contact_name]
      @name = session[:contact_name]
      session[:contact_name] = nil
    end
  end

  #Post Action

  #Action to Submit a contact message
  def SubmitContact
    c = Contact.new
    #Add contact name to session[:contact_name]
    session[:contact_name] = params[:name]

    #Save a contact message to database
    c.name = params[:name]
    c.email = params[:email]
    c.subject = params[:subject]
    c.message = params[:message]

    if c.save then
      #if c.save == true redirect to "home/SubmitSucess": home/SubmitSucess.html.erb view and send a mail to notify
      NotificationMailer.Contact(c.subject,c.email,c.name,c.message).deliver
      NotificationMailer.ContactConfirm(c.name,c.email).deliver
      redirect_to "/contact-submit-sucess"
    else
      #If c.save == false redirect to "home/SubmitSucess": home/SubmitFalse.html.erb view and send a mail to notify
      NotificationMailer.ContactSubmitFailed.deliver
      redirect_to "/contact-submit-failed"
    end
  end

  #Action signup for newsletter
  def NewsletterSignup

    if Email.find_by_email(params[:EMAIL]) == nil then
      #If input email is not null create a new email record
      e = Email.new
      e.email = params[:EMAIL]

      if e.save then
        #If record saved success sent a notification message and redirect to home page
        NotificationMailer.Newsletter(e.email).deliver
        NotificationMailer.NewsletterConfirm(e.email).deliver
        redirect_to "/home"
      else
        #If saved fail sent a failed notification message and redirect to home page
        NotificationMailer.NewsletterSignupFailed.deliver
        redirect_to "/home"
      end
    else
      #If input email is none redirect to home
      redirect_to "/home"
    end
  end

end
