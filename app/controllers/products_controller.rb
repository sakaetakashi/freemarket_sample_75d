class ProductsController < ApplicationController

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
  


  
  # def buy
  #   # @user = current_user
  #   # @creditcard = Creditcard.where(user_id: current_user.id).first
  #   # @address = Address.where(user_id: current_user.id).first
  #   # @product = Product.find(params[:id])
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  #   Payjp::Customer.retrieve(
  #     descriptuon: test)
  #   # @creditcard_information = customer.cards.retrieve(@creditcard.card_id)
  #   # @card_brand = @creditcard_information.brand 
  #   # case @card_brand
  #   #   when "Visa"
  #   #     @card_src = "visa.svg"
  #   #   when "JCB"
  #   #     @card_src = "jcb.svg"
  #   #   when "MasterCard"
  #   #     @card_src = "master-card.svg"
  #   #   when "American Express"
  #   #     @card_src = "american_express.svg"
  #   #   when "Diners Club"
  #   #     @card_src = "dinersclub.svg"
  #   #   when "Discover"
  #   #     @card_src = "discover.svg"
  #   # end
  # end
  
  require 'payjp'
  def purchase
    @card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
    #保管した顧客IDでpayjpから情報取得
    @customer = Payjp::Customer.retrieve(@card.customer_id)
    #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    @default_card_information = @customer.cards.retrieve(@card.card_id)

    # @product = Product.find(params[:id])
    # @credit_card = Credit_card.where(user_id: current_user.id).first
    # if credit_card.blank?
    #   redirect_to controller: "credit_card", action: "new"
    # else
    #   @products = Product.find(params[:id])
    #   Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
    #   card = Card.where(user_id: current_user.id).first
    #   Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
    #   Payjp::Charge.create(
    #   :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    #   :customer => card.customer_id, #顧客ID
    #   :currency => 'jpy', #日本円
    # )
    # redirect_to action: 'done' #完了画面に移動
    # end
      # charge = Payjp::Charge.create(
      #   # escriptuon: test)
      #   amount: 300, 
      #   card: params['payjp-token'],
      #   # customer: Payjp::Customer.retrieve(@credit_card.customer_id), 
      #   currency: 'jpy'
    # )
    # @product_buyer = Product.find(params[:id])
    # @product_buyer.update( buyer_id: current_user.id)
    # redirect_to purchased_product_path
    # end
  end

  def credit_card_blank
    card = CreditCard.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "credit_card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
    Payjp::Charge.create(
    :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  # private

  # def product_params
  #   params.require(:product).permit(:name, :text, :price,).merge(user_id: current_user.id)
  # end
end

