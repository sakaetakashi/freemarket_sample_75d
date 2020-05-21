Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources  :products
  resources  :images
  resources  :addresses
  resources  :categories
  resources  :credit_cards
  

end
