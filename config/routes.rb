Rails.application.routes.draw do

  resources :projects

  get 'landingpage/landingpage'
  root to: 'landingpage#landingpage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
