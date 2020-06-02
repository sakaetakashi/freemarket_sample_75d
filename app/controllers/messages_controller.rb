class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to product_path(params[:product_id]), notice: 'コメントしました'
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
