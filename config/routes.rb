Rails.application.routes.draw do
  root 'landing_page#welcome'

  devise_for :users,
              controllers: {
                registrations: 'users/registrations'
              }

  devise_scope :user do
     get 'users/profile', to: 'users/registrations#profile', as: :current_user_profile
     get 'users/:id', to: 'users/registrations#show', as: :user_profile
  end

  resources :dares, only: [:create, :destroy, :new, :show]
  resources :dare_submissions,          only: [:create, :edit, :destroy, :new]
  get 'dares/', to: 'dares#index', as: :show_dare_list
  resources :comment_likes 
  resources :comments, only: [:create, :destroy]
end
