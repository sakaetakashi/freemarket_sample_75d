Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations' }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'products#index'
  resources  :products do
    collection do
      get 'purchase/:id', to: 'products#purchase'
      post 'pay/:id', to: 'products#pay'
      get 'done', to: 'products#done'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources  :messages, only: :create
  end

  post "favorites/:product_id/create" => "favorites#create"
  post "favorites/:product_id/destroy" => "favorites#destroy"
  resources :favorites, only: [:index]

  resources  :categories
  resources  :images, only: [:new, :show]
  resources  :addresses
  resources  :users, only: [:edit, :update, :show]

  resources  :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'register', to: 'credit_cards#register'
      post 'delete', to: 'credit_cards#delete'
    end
  end

end
