# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Rails.application.routes.draw do
  #Set root website to "home/Home": Home.html.erb (set home page)
  root 'home#Home'

  #Get method declare here
  get '/home/Home'
  get '/home/SubmitSucess'
  get '/home/SubmitFailed'

  #Post method declare here
  post '/home/SubmitContact'

  scope module: 'admin', path: 'admin' do
    root 'home#Home'
    get '/home/Home'
  end
end
