class HomeController < ApplicationController
  def Home
    #Main Variables
    @name = "Nguyen Ly Quan"
    @intro = "Who are in extremely love with coding."
    @quote = "Work gives you meaning and purpose and life is empty without it."
    @quotesowner = "Stephen Hawking"
    pi = PersionalInfo.first
    p = Project.limit(4)

    #Partial View "home/Banner": _Banner.html.erb
    @specialist = Specialized.find_by_id(pi.specializedid).name
    @about = PersionalInfo.first.about

    #Partial View "home/Service": _Service.html.erb
    @devlanguage = DevLanguage.all

    #Partial View "home/About": _About.html.erb
    @skill = Skill.all
    @email = pi.email
    @phone = pi.phone

    #Partial View "home.Project": _Project.html.erb
    @project = p
  end

end
