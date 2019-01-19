Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Set root website to "home/Home": Home.html.erb (set home page)
  root 'home#Home'

  # Get method declare here
  get 'home' => 'home#Home'
  get 'contact-submit-sucess' => 'home#SubmitSucess'
  get 'contact-submit-failed' => 'home#SubmitFalse'

  # Post method declare here
  post 'contact-submit' => 'home#SubmitContact'
  post 'newsletter-sign-up' => 'home#NewsletterSignUp'

  # Set Admin scope with "admin" directory
  scope module: 'admin', path: 'admin' do
    # Set scope admin's root
    root 'dash_board#DashBoard'

    # Get method for admin scope declare here
    get 'dash-board' => 'dash_board#DashBoard'

    ## Login
    get 'login' => 'login#Show'
    get 'sign-out' => 'login#SignOut'

    ## Project
    get 'project' => 'project#Show'
    get 'project/:id/delete' => 'project#Delete'

    ## Contact
    get 'contact' => 'contact#Show'
    get 'contact-all' => 'contact#ShowAllContact'
    get 'contact/:id/delete' => 'contact#Delete'

    ## Tool
    get 'tool' => 'tool#Show'

    ## About
    get 'about' => 'about#Show'
    get 'about/:id/delele-skill' => 'about#DelSkill'

    ## Account Settings
    get 'account-settings' => 'account_settings#Show'

    # Post method for admin scope declare here

    ## Login
    post 'login/submit' => 'login#Login'

    ## Project
    post 'project/:id/edit' => 'project#Edit'
    post 'project/create' => 'project#Create'
    post 'project/search' => 'project#Search'

    ## Contact
    post 'contact/search' => 'contact#Search'

    ## About
    post 'about/add-skill' => 'about#EditSkill'
    post 'about/:id/edit-skill' => 'about#EditSkill'


  end
end
