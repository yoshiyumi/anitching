class Tag < ApplicationRecord
has_many :tagmaps, dependent: :destroy
  has_many :blogs, through: :tagmaps
end
