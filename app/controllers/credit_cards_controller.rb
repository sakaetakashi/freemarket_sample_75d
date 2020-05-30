class CreditCardsController < ApplicationController
  before_action :set_card, only: [:new, :show, :delete]
  require "payjp"

  def new
    redirect_to action: "show" if card.exists?
  end

  def pay 
    Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
  
    if params['payjp-token'].blank?
      flash[:notice]="カードの内容を確認してください"
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      email: current_user.email, 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def show 
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def delete 
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  private
  def set_card
    card = CreditCard.find_by(user_id: current_user.id)
  end

end
  
  