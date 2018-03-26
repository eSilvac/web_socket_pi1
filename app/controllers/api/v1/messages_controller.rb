class Api::V1::MessagesController < ApplicationController
  protect_from_forgery with: :null_session
  # before_action :authenticate

  def create
    mensaje = message_params[:text]
    if mensaje != ""
      Pusher.trigger('messages_channel', 'my-message', {
        message: message_params[:text]
      })
    end

    # @message = message_params 

    # render 'api/v1/create.js.erb', format: :js
  end

  private
    def message_params
      params.permit(:text)
    end

    def authenticate
      unless User.where(api_token: request.headers['HTTP_X_API_TOKEN']).exists? 
        head 401
      end
    end

end