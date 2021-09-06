class Tag < ApplicationRecord
    has_many :works, dependent: :destroy
end
