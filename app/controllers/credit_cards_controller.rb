class CreditCardsController < ApplicationController

  require 'payjp'
  before_action :set_card


  def index

  end

  def new
    card = Credit_card.where(user_id: current_user.id)
    if card.present?
      redirect_to action: "show"
    end 
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
  

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Custommer.create(
        description: 'test', 
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
        )
      @card = Credit_card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def purchase
#クレジットカードと製品の変数を設定
    @creditcard = Creditcard.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
  #Payjpの秘密鍵を取得
    Payjp.api_key= '秘密鍵'
  #payjp経由で支払いを実行
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@creditcard.customer_id),
      currency: 'jpy'
    )
#製品のbuyer_idを付与
    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id)
    redirect_to purchased_product_path
  end
 

  private
  def set_card
    @card = Credit_card.where(user_id: current_user.id).first if Credit_card.where(user_id: current_user.id).present?
  end

end
