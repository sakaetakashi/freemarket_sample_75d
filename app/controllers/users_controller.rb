class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
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
  
  # private
  #   def user_params
  #     params.require(:address).permit(:post_code, :prefecture, :city, :block, :building)
  #   end

end
