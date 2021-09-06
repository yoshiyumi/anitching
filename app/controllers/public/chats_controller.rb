class Public::ChatsController < ApplicationController
    def show
        @customer = Customer.find(params[:id])
        rooms = current_customer.matchings.pluck(:room_id)
        matchings = Matching.find_by(customer_id: @customer.id, room_id: rooms)
        unless matchings.nil?
            @room = matchings.room
        else
            @room = Room.new
            @room.save
            Matching.create(customer_id: current_customer.id, room_id: @room.id)
            Matching.create(customer_id: @customer.id, room_id: @room.id)
        end
        @chats = @room.chats
        @chat = Chat.new(room_id: @room.id)
    end
    def create
      @chat = current_customer.chats.new(chat_params)
      @chat.save
      redirect_to request.referer
    end

    private
    def chat_params
      params.require(:chat).permit(:message, :room_id)
    end
end
