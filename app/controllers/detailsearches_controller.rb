class DetailsearchesController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @details = @q.result(distinct: true)
  end
end
