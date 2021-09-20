class Public::RoomsController < ApplicationController
    before_action :authenticate_customer!
    def index
        rooms = Matching.where(customer_id: current_customer.id).pluck(:room_id)
        @room_lists = Matching.where(room_id: rooms).where.not(customer_id: current_customer.id)
    end
end
