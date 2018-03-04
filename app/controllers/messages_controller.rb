class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    
  end

  def send_message
    mensaje = message_params[:text]
    if mensaje != ""
      Pusher.trigger('messages_channel', 'my-message', {
        message: message_params[:text],
        from: current_user.email
      })
    end
  end

  private
    def message_params
      params.require(:message).permit(:text)
    end

end
