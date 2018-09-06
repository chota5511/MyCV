Rails.application.routes.draw do
  #Set root website to "home/Home": Home.html.erb (set home page)
  root 'home#Home'

  #Get method declare here
  get '/home/Home'
  get '/home/SubmitSucess'
  get '/home/SubmitFailed'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #Post method declare here
  post '/home/SubmitContact'

  scope module: 'admin', path: 'admin' do
    get 'home/Home'
  end
end
