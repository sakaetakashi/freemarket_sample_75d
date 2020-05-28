class ProductsController < ApplicationController

  def index
    @products = Product.all.order("created_at DESC").limit(3)
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
  
end

