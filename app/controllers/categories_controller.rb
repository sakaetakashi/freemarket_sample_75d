class CategoriesController < ApplicationController
  def index
    @parents = Category.roots
  end

  def show 
    @parent = Category.find(params[:id])
  end

  def subcategory
    @child = Category.find(params[:id])
  end

  def item
    @grandchild = Category.find(params[:id])
    @products = Product.where(category_id: @grandchild.id)
  end
end
