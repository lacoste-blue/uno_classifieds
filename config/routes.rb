Rails.application.routes.draw do
  get 'listings/grid' => 'listings#grid'
  get 'listings/list' => 'listings#list'
  resources :listings
  resources :categories
  resources :pictures
  devise_for :users, :controllers => { :registrations => 'registrations' }

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Sets landing page:
  root 'home#index'
end

