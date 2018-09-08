Rails.application.routes.draw do
  # Set root website to "home/Home": Home.html.erb (set home page)
  root 'home#Home'

  # Get method declare here
  get 'home' => 'home#Home'
  get 'contact-submit-sucess' => 'home#SubmitSucess'
  get 'contact-submit-failed' => 'home#SubmitFalse'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # Post method declare here
  post 'contact-submit' => 'home#SubmitContact'

  # Set Admin scope with "admin" directory
  scope module: 'admin', path: 'admin' do
    # Set scope admin's root
    root 'dash_board#DashBoard'

    # Get method for admin scope declare here
    get 'dash-board' => 'dash_board#DashBoard'
    get 'login' => 'login#Show'
    get 'sign-out' => 'login#SignOut'

    # Post method for admin scope declare here
    post 'login/submit' => 'login#Login'

  end
end
