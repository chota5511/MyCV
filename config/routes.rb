Rails.application.routes.draw do
  # Set root website to "home/Home": Home.html.erb (set home page)
  root 'home#Home'

  # Get method declare here
  get '/home/Home'
  get '/home/SubmitSucess'
  get '/home/SubmitFailed'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # Post method declare here
  post '/home/SubmitContact'

  # Set Admin scope with "admin" directory
  scope module: 'admin', path: 'admin' do
    # Set scope admin's root
    root 'dash_board#DashBoard'

    # Get method for admin scope declare here
    get '/dash_board/DashBoard'
    get '/login/Show'
    get '/login/SignOut'

    # Post method for admin scope declare here
    post '/login/Login'

  end
end
