class MessagesController < ApplicationController
  include MessagesHelper

  def index
  end

  def send_page
  end

  def send_message
    datos = Datum.all

    datos.each do |e|
      e.speed
      coords = {
        lat: e.lat,
        lng: e.lng,
        speed: e.speed,
        train: "Tranvia1"
      }
      Pusher.trigger('messages_channel', 'my-message', {
        coords: coords
      })

      puts Time.new
    end


    # if mensaje != ""
    #   Pusher.trigger('messages_channel', 'my-message', {
    #     message: message_params[:text],
    #     from: current_user.email
    #   })
    # end
  end

  private
    def message_params
      params.require(:message).permit(:text)
    end

end
