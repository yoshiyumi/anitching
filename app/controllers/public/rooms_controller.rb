class Public::RoomsController < ApplicationController
    def index
        rooms = Matching.where(customer_id: current_customer.id).pluck(:room_id)
        @room_lists = Matching.where(room_id: rooms).where.not(customer_id: current_customer.id)
    end
end
