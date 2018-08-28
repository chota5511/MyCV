class HomeController < ApplicationController
  def Home
    #Partial View "home/Banner": _Banner.html.erb
    p = PersionalInfo.first
    @specialist = Specialized.find_by_id(p.specializedid).name
    @about = PersionalInfo.first.about


  end

end
