class ProductsController < ApplicationController
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
    if params[:product][:images_attributes] && @product.save
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
    params.require(:product).permit(:buyer_id, :category_id, :product_name, :explain, :price, :brand, :condition, :arrive_at, :shipping_fee, :region_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
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

