Rails.application.routes.draw do

  get 'users/show'
  get 'users/destroy'

  devise_for :users

  resources :projects do
    resources :comments
  end

  resources :users
  get 'landingpage/landingpage'
  root to: 'landingpage#landingpage'

  get "/404", :to => "errors#not_found"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
