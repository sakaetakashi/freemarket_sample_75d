class ProductsController < ApplicationController

  before_action :set_product, only:[:show, :purchase, :pay]
  before_action :set_card, only:[:purchase, :pay]
  before_action :move_to_login, only: [:purchase, :new, :edit, :destroy]

  require 'payjp'
 
  def index
    @products = Product.includes(:images).order("created_at DESC").limit(3)
  end

  def new
    @product = Product.new
    @product.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name) #いらない?
    @category_parent_array.unshift("---") #いらない?
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.images.new
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
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


  def purchase
    @image = Image.find_by(product_id: @product.id)
    @address = Address.find_by(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)
    session[:product_id] = @product.id
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end
  
  def pay
    Payjp.api_key = Rails.application.credentials.dig(:payjp_secret_key)
    Payjp::Charge.create(
    :amount => @product.price, 
    :customer => Payjp::Customer.retrieve(@card.customer_id), 
    :currency => 'jpy', 
    )
    @product.update(buyer_id: current_user.id)
    session[:product_id] = nil
    redirect_to "/products/done"
    
  end

  def done
  end

  private
  def product_params
    params.require(:product).permit(:buyer_id, :category_id, :product_name, :explain, :price, :brand, :condition, :arrive_at, :shipping_fee, :region_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def move_to_login
    redirect_to  new_user_session_path unless user_signed_in?
  end

end

