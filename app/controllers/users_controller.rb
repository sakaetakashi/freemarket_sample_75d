class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @products = Product.where(buyer_id: @user)
  end
  
  # private
  #   def user_params
  #     params.require(:address).permit(:post_code, :prefecture, :city, :block, :building)
  #   end


end
