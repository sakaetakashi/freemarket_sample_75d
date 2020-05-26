Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations' }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources  :products do
      
  resources  :categories
  resources  :images
  resources  :addresses
  resources  :credit_cards
  resources  :users, only: [:edit, :update]
  resources  :homes


  post 'pay' => 'products#pay'
  get 'purchase' => 'products#purchase'

end
