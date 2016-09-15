Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }

  root :to => "posts#index"

  resources :posts
  resources :accounts

end
