Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations' }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'products#purchase'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources  :products do
    collection do
      get 'purchase', to: 'products#purchase'
      post 'pay', to: 'products#pay'
      get 'done', to: 'products#done'
    end
  end
  
  resources  :categories
  resources  :images
  resources  :addresses
  
  resources  :users, only: [:edit, :update]


  resources  :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'make', to: 'credit_cards#make'
      post 'delete', to: 'credit_cards#delete'
    end
  end
 
end
