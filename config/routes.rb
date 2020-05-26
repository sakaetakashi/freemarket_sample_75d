Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations' }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'products#index'

  resources  :products
  resources  :categories
  resources  :images
  resources  :addresses
  resources  :credit_cards
  resources  :users, only: [:edit, :update]


end
