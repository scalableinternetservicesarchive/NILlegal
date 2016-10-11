Rails.application.routes.draw do
  root 'landing_page#welcome'

  devise_for :users
end
