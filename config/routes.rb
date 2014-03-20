ScotchClub::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
    resources :shots
  end

  namespace :admin do 
  	get '', to: 'dashboard#index', as: '/' 
  end 
end