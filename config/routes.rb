Rails.application.routes.draw do
  devise_for :users
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#welcome'
  get   '/signup',  to:  'users#new'
end
