class HomeController < ApplicationController
  def Home
    #Main Variables
    @name = "Nguyen Ly Quan"
    @intro = "Who are in extremely love with coding."
    @quote = "Work gives you meaning and purpose and life is empty without it."
    @quotesowner = "Stephen Hawking"
    p = PersionalInfo.first

    #Partial View "home/Banner": _Banner.html.erb
    @specialist = Specialized.find_by_id(p.specializedid).name
    @about = PersionalInfo.first.about

    #Partial View "home/Service": _Service.html.erb
    @devlanguage = DevLanguage.all

    #Partial View "home/About": _About.html.erb
    @skill = Skill.all
    @email = p.email
    @phone = p.phone

  end

end
