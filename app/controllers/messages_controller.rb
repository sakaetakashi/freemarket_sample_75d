class MessagesController < ApplicationController

  def create
    message = Message.create(message_params)
    redirect_to "/products/#{message.product.id}"
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
