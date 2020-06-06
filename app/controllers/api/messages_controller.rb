class Api::MessagesController < ApplicationController
  def index
    product = Product.find(params[:product_id])
    last_message_id = params[:id].to_i
    @messages = product.messages.includes(:user).where("id > ?", last_message_id)
  end
end