ScotchClub::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  namespace :admin do 
  	get '', to: 'dashboard#index', as: '/' 
  end 
end