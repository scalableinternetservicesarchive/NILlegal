Rails.application.routes.draw do
  root 'landing_page#welcome'

  devise_for :users,
              controllers: {
                registrations: 'users/registrations'
              }

  devise_scope :user do
     get 'users/show', to: 'users/registrations#show', as: :show_user_registration
  end
end
