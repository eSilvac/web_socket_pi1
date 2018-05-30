class MessagesController < ApplicationController
  include MessagesHelper

  def index
  end

  def send_page
  end

  def send_message
    datos_tren_1 = Datum.where(train: "TN-2")
    #datos_tren_2 = Datum.where(train: "TN-1")

    datos_tren_1.each do |e|

      coords_train_1 = {
        lat: e.lat,
        lng: e.lng,
        speed: e.speed,
        train: "TA-12NT"
      }

      # segundo =  datos_tren_2[index]
      #
      # if segundo != nil
      #   coords_train_2 = {
      #     lat: segundo.lat,
      #     lng: segundo.lng,
      #     speed: segundo.speed,
      #     train: "TA-13NT"
      #   }
      # else
      # coords_train_2 = { lat: 0, lng: 0, speed: 0 }
      # end

      Pusher.trigger('messages_channel', 'my-message', {
        coords_train1: coords_train_1
      })

      sleep 1
      puts "Still running...."
    end

  end

  private
    def message_params
      params.require(:message).permit(:text)
    end

end
