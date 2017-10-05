Rails.application.routes.draw do
  resources :listings
  resources :sub_categories
  resources :categories
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Sets landing page:
  root 'home#index'
end
