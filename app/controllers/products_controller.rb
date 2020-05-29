class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order("created_at DESC").limit(3)
  end

  def new
    @product = Product.new
    @product.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("---")
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @product = Product.find(params[:id])
    @grandchild = @product.category
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def destroy
  end

  def get_category_children
    @category_children = Category.find(params[:category_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

def product_params
  params.require(:product).permit(:category_id, :product_name, :explain, :price, :brand, :condition, :arrive_at, :shipping_fee, :region, images_attributes: [:src]).merge(user_id: current_user.id)
end
  
  require 'payjp'

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to action: :done
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

  # def purchase
  #   @credit_card = Credit_card.where(user_id: current_user.id).first
  #   @product = Product.find(params[:id])
  #   Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #   charge = Payjp::Charge.create(
  #     # escriptuon: test)
  #     amount: 300, 
  #     card: params['payjp-token'],
  #     # customer: Payjp::Customer.retrieve(@credit_card.customer_id), 
  #     currency: 'jpy'
  #   )
  #   # @product_buyer = Product.find(params[:id])
  #   # @product_buyer.update( buyer_id: current_user.id)
  #   redirect_to purchased_product_path
  # end

  # private

  # def product_params
  #   params.require(:product).permit(:name, :text, :price,).merge(user_id: current_user.id)
  # end
end

