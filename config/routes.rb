ScotchClub::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :relationships, only: [:create, :destroy]
  resources :check_ins
  devise_for :check_ins
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  devise_for :liquors
  resources :liquors do
  end

  namespace :admin do 
  	get '', to: 'dashboard#index', as: '/' 
  end 

  post ':controller(/:action(/:id(.:format)))'
  get ':controller(/:action(/:id(.:format)))'
end