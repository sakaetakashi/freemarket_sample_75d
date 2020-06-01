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

  private

    def user_params
      params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :birthday, :email)
    end

end
