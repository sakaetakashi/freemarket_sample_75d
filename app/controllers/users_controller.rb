class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @products = Product.where(buyer_id: @user)
    @favorite = Favorite.where(product_id: current_user.id)
  end

  
end
