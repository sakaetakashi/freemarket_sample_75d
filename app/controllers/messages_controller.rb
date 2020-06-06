class MessagesController < ApplicationController

  def create
    @message = Message.create(message_params)
    respond_to do |format|
      format.html { redirect_to product_path(params[:message_id])}
      format.json
    end

  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
