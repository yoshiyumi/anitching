class Room < ApplicationRecord
  has_many :matchings
  has_many :chats
end
