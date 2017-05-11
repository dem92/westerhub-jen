Rails.application.routes.draw do

  #get 'users/show'
  #get "/users/profile" => "users#profile", :as => 'profile'

  devise_for :users
  resources :projects
  resources :users

  get 'landingpage/landingpage'
  root to: 'landingpage#landingpage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
