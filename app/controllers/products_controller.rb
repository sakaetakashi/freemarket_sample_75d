class ProductsController < ApplicationController

  require 'payjp'
  
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  


  def purchase
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to purchase_products_path
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  # def credit_card_blank
  #   @card = CreditCard.where(user_id: current_user.id).first
  #   if @card.blank?
  #     redirect_to controller: "credit_card", action: "new"
  #   else
  #     Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
  #     @customer = Payjp::Customer.retrieve(@card.customer_id)
  #     @default_card_information = @customer.cards.retrieve(@card.card_id)
  #   end
  # end
  
  def pay
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
    Payjp::Charge.create(
    :amount => 13500, 
    :customer => card.customer_id, 
    :currency => 'jpy', 
    )
    redirect_to action: 'done' 
  end

 
end

